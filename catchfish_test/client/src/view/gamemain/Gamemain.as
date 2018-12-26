package client.src.view.gamemain {
import client.src.GlobalConfig;
import client.src.GlobalConfig;
import client.src.GlobalConfig;
import client.src.element.bullet.Bullet;
import client.src.element.bullet.BulletFactory;
import client.src.element.cannon.Cannon;
import client.src.element.coin.CoinFactory;
import client.src.element.fish.Fish;
import client.src.element.fish.FishFactory;
import client.src.element.seaweed.SeaweedFactory;
import client.src.element.tool.Tool;
import client.src.element.tool.ToolFactory;
import client.src.manager.GameEvent;
import client.src.manager.GameEventDisPatch;
import client.src.view.InfoLog.Infolog;
import client.src.view.gameInfo.GameInfo;
import client.src.view.tips.CustomTips;
import client.src.view.utils.CritUtils;

import laya.d3.math.Vector2;

import laya.d3.math.Vector2;
import laya.d3.math.Vector3;
import laya.d3.math.Vector4;

import laya.events.Event;
import laya.maths.Point;
import laya.maths.Rectangle;
import laya.utils.Browser;
import laya.utils.Pool;
import laya.utils.TimeLine;

import ui.GameViewUI;

public class Gamemain extends GameViewUI{
    private static var _instance:Gamemain;
    private var _cannonPlayer:Cannon;

    public function Gamemain() {
    }
    public static function get instance():Gamemain
    {
        return _instance||=new Gamemain();
    }

    public function openPanel():void
    {
        initData();
        initView();
        initEvent();
    }

    private function initData():void
    {
        GlobalConfig.lvnum=1;

    }
    private function initView():void
    {
        //海藻
        SeaweedFactory.instance.creatSeaweed(bottomCon,15);
        //炮
        _cannonPlayer=new Cannon();
        _cannonPlayer.init(dz.x,dz.y-30);
        this.addChild(_cannonPlayer);
        _cannonPlayer.type=GlobalConfig._baseCannonType;
        //信息页
        Infolog.instance.openPanel();
        //计分页
        this.addChild(GameInfo.instance);
        GameInfo.instance.openPanel();
        CoinFactory.instance.init();
    }


    private function initEvent():void
    {
        this.on(Event.MOUSE_DOWN,this,onMouseDown);
        btn_pre.on(Event.MOUSE_DOWN,this,changeCannon);
        btn_next.on(Event.MOUSE_DOWN,this,changeCannon);
        btn_info.on(Event.MOUSE_DOWN,this,function () {
            Infolog.instance.openPanel();
        });

        Laya.timer.loop(fishInterval,this,createFishs);
        Laya.timer.frameLoop(1,this,loopHandler);
    }

    private const fishInterval:Number=1000;
    private function createFishs():void
    {
        if(FishFactory.instance.fishArr.length>=GlobalConfig._maxFishNum) return;

        var fish:Fish=FishFactory.instance.createFish();
        var dx:Number=(Math.random()>.5)? 0:GlobalConfig._GlobalWidth;
        var dy:Number=100+Math.floor(Math.random()*400);
        fish.init(dx,dy);
        FishFactory.instance.fishArr.push(fish);
        this.addChild(fish);
    }

    private function changeCannon(e:Event):void
    {
        e.stopPropagation();
        if(e.currentTarget==btn_next){
            _cannonPlayer.type++;
        }else if(e.currentTarget==btn_pre){
            _cannonPlayer.type--;
        }
    }


    private function onMouseDown():void
    {
        if(this.mouseY>=GlobalConfig._GlobalHeight-GlobalConfig._fixbroad){
            return;
        }

        if(Browser.now() >= _cannonPlayer.fightTime+GlobalConfig._fightInterval){
            var bullet:Bullet=BulletFactory.instance.createBulletByType(_cannonPlayer.type);
            if(checkCanShoot(bullet)){
                this.addChild(bullet);
                _cannonPlayer.fightAni();
                bullet.init(_cannonPlayer.x,_cannonPlayer.y,_cannonPlayer.rotation);
                BulletFactory.instance.bulletArr.push(bullet);
            }
        }
    }
    private function checkCanShoot(vo:Bullet):Boolean{
        if (GlobalConfig._coinNum-vo.power < 0){
            CustomTips.instance().AddTip(this, "能量不足！！", "right", true, 100, 100, 300, false, 60, 3);
            return false;
        }
        return true;
    }



    private function loopHandler():void
    {
        checkHitFish();
        checkHitPOP();
    }

    private function checkHitFish():void
    {
        var bullet:Bullet;
        var bulletR:Number;
        var fish:Fish;
        var hitPoint:Point;
        var rect:Rectangle;
        var rectP:Point;
        for(var i:int=BulletFactory.instance.bulletArr.length-1;i>=0;i--){

            bullet=BulletFactory.instance.bulletArr[i];
            if(!bullet.live){
                continue;
            }
            hitPoint=bullet.hitPoint;
            bulletR=bullet.powerRadius;

            for(var k:int=FishFactory.instance.fishArr.length-1;k>=0;k--){
                fish=FishFactory.instance.fishArr[k];

                if(!fish.live){
                    continue;
                }

                rect=fish.hitRect;
                rectP=new Point(fish.x,fish.y);
                //if(checkHit3(hitPoint,bulletR,rect));
                //if(bulletHit(hitPoint,rect)){
                if(checkHit2(hitPoint,rectP,rect,bulletR)){
                    if(fish.live && bullet.live){
                        bullet.live=false;
                        BulletFactory.instance.bulletArr.splice(i,1);

                        fish.HP=fish.HP-getBulletPower(bullet);
                        if(fish.HP<=0){
                            fish.live=false;
                            FishFactory.instance.fishArr.splice(k,1);
                            createTools(fish);
                        }
                    }
                }


            }
        }
    }

    private function getBulletPower(bullet:Bullet):Number
    {
        var value:Number=bullet.power*GlobalConfig._shootPower;
        const min:Number=2;
        const max:Number=4;
        var bei:Number=1;
        if(Math.random()>0.6){
            bei=min+Math.floor(Math.random()*max);
            var crit:CritUtils=new CritUtils(bei);
            this.addChild(crit);
            crit.pos(bullet.x,bullet.y);
        }

        return value*bei;
    }

    private function createTools(fish:Fish):void
    {
        var fishId:Number=fish.typeid;
        var tool:Tool;
        if(fishId==9){
            tool=ToolFactory.instance.createTool(1);
        }else if(fishId==7){
            tool=ToolFactory.instance.createTool(2);
        }else if(fishId==8){
            tool=ToolFactory.instance.createTool(3);
        }else if(fishId==12){
            tool=ToolFactory.instance.createTool(4);
        }

        if(tool){
            tool.pos(fish.x, fish.y);
            this.addChild(tool);
        }
    }




    private function checkHitPOP():void
    {
        var bullet:Bullet;
        var tool:Tool;
        for(var i:int=ToolFactory.instance.toolArr.length-1;i>=0;i--){
            tool=ToolFactory.instance.toolArr[i];
            if(!tool.live){
                continue;
            }

            for(var k:int=BulletFactory.instance.bulletArr.length-1;k>=0;k--){
                bullet=BulletFactory.instance.bulletArr[i];
                if(!bullet.live){
                    continue;
                }

                if(checkHit4(bullet,tool)){
                    bullet.live=false;
                    BulletFactory.instance.bulletArr.splice(i,1);

                    tool.live=false;
                    tool.eatAn();
                    ToolFactory.instance.toolArr.splice(k,1);

                    getpopPower(tool);
                }
            }
        }
    }

    private function getpopPower(tool:Tool):void
    {
        var type:Number=tool.type;
        console.log("-popId:",type);
        //9 7 8 12
        if(1==type){
            FishFactory.instance.clearAllFish();
            Laya.timer.once(800,this,function () {
                //清屏
                var timeline:TimeLine=new TimeLine();
                timeline
                        .addLabel("right", 0).to(bottomCon, {centerX:0,centerY:0,alpha:0.5}, 80)
                        .addLabel("left",0).to(bottomCon, {centerX:20,centerY:0,alpha:1}, 50)
                        .addLabel("right2", 0).to(bottomCon, {centerX:-20,centerY:0,alpha:0.5}, 80)
                        .addLabel("left2", 0).to(bottomCon, {centerX:10,centerY:20,alpha:1}, 50)
                        .addLabel("right3", 0).to(bottomCon, {centerX:-10,centerY:-20,alpha:0.5}, 80)
                        .addLabel("left3",0).to(bottomCon, {centerX:0,centerY:0,alpha:1}, 50)

                timeline.play(0, false);
                timeline.once(Event.COMPLETE, this, function(){
                    timeline.destroy();
                    bottomCon.alpha = 1;
                })
            })
        }else if(2==type){
            //宝箱
            GameEventDisPatch.instance.event(GameEvent.FISHDIE_COIN,[new Point(tool.x,tool.y),400,tool]);
        }else if(3==type){
            //武器
            GlobalConfig._shootPower=3;
            _cannonPlayer.showflash(true);
            CustomTips.instance().AddTip(this, "武器增强！！", "warn", true, 100, 100, 300, false, 100, 3);
            Laya.timer.once(10000,this,function () {
                GlobalConfig._shootPower=1;
                _cannonPlayer.showflash(false);
            })
        }else if(4==type){
            //鱼饵
            createFishGroup();
        }
    }

    private function createFishGroup(count:Number=6):void
    {
        CustomTips.instance().AddTip(this, "鱼群来袭!,鱼群中的鱼有双倍奖励哦！", "right", true, 100, 100, 300, false, 100, 3);
        var dir:String=Math.random()>0.5? "right":"left";
        var fishtype:Number=Math.ceil(Math.random()*4);
        const delay:Number=3000;
        for (var i:int=0;i<count;i++){
            Laya.timer.once(delay+i*delay,this,function () {
                createFishOrder(Math.floor(Math.random() * 4), fishtype,dir);
            })
        }
    }

    private function createFishOrder(flag:Number = 0,type:Number=0,dirs:String="left"):void {
        //flag: 0心 1矩形 2菱形 3圆形
        var pathArr:Array=[];
        var fixX:Number=0;
        var fixY:Number=0;
        if(0==flag){
            pathArr=FishFactory.instance.heartPathDot();
            if (dirs == "right") {
                fixX = -600;
            }else {
                fixX = GlobalConfig._GlobalWidth+600;
            }
            fixY=400;
        }else if(1==flag){
            pathArr=FishFactory.instance.rectPathDot();
            if (dirs == "right") {
                fixX = -600;
            }else {
                fixX = GlobalConfig._GlobalWidth+600;
            }
            fixY = 250;
        }else if(2==flag){
            pathArr=FishFactory.instance.rhombPathDot();
            if (dirs == "right") {
                fixX = -600;
            }else {
                fixX = GlobalConfig._GlobalWidth+600;
            }
            fixY = 100;
        }else if(3==flag){
            pathArr=FishFactory.instance.circlePathDot();
            if (dirs == "right") {
                fixX = -600;
            }else {
                fixX = GlobalConfig._GlobalWidth+600;
            }
            fixY = 350;
        }

        var fish:Fish;
        var p:Point;
        var newp:Point;
        for(var i:int=0;i<pathArr.length;i++){
            p=pathArr[i];
            newp=new Point(p.x+fixX,p.y+fixY);

            fish=FishFactory.instance.createFishById(type);
            fish.init(newp.x,newp.y);
            FishFactory.instance.fishArr.push(fish);
            this.addChild(fish);
        }
    }



    private function checkHit4(bullet:Bullet,tool:Tool):Boolean
    {
        var toolR:Number=tool.powerRadius;
        var bulletR:Number=bullet.powerRadius;

        var toolPoint:Point=tool.hitPoint;
        var bulletPoint:Point=bullet.hitPoint;

        var u:Number=bulletPoint.distance(toolPoint.x,toolPoint.y);
        if(u<=toolR+bulletR){
            return true;
        }
        return false;
    }

    private function checkHit2(circleP:Point,rectP:Point,rect:Rectangle,circleR:Number):Boolean
    {
        var h:Vector2=new Vector2(rect.width/2,rect.height/2);
        var v:Vector2=new Vector2(Math.abs(circleP.x-rectP.x),Math.abs(circleP.y-rectP.y));
        var u:Vector2=new Vector2(Math.max(v.x-h.x,0),Math.max(v.y-h.y,0));
        return Vector2.dot(u,u)<=circleR*circleR;
    }

    private function checkHit(pot:Point,rect:Rectangle):Boolean
    {
        return rect.contains(pot.x,pot.y);
    }

    private function checkHit3(circleP:Point,circleR:Number,frect:Rectangle):Boolean
    {
        var bc:Point = circleP;
        var br:Number = circleR;
        var xv:Number = 10;//修正范围
        var p1:Point = new Point(frect.x+xv, frect.y+xv);//左上
        var p2:Point = new Point(frect.x+xv + frect.width-xv*2, frect.y+xv);//右上
        var p3:Point = new Point(frect.x+xv, frect.y+xv+frect.height-xv*2);//左下
        var p4:Point = new Point(frect.x+xv + frect.width-xv*2, frect.y+xv + frect.height-xv*2);//右下

        var arr4:Array = getNode(p1, p2, bc, br);
        var arr3:Array = getNode(p1, p3, bc, br);
        var arr2:Array = getNode(p2, p4, bc, br);
        var arr1:Array = getNode(p3, p4, bc, br);


        var arr:Array = arr1.concat(arr2).concat(arr3).concat(arr4);
        var boo:Boolean = false;

        return isOver(frect,arr);
    }
    /**
     * 是否包含集合中的任意一个点
     * @param	frect
     * @param	parr
     * @return
     */
    private function isOver(frect:Rectangle,parr:Array):Boolean{
        for (var i = 0; i < parr.length; i++){
            var p:Point = parr[i];
            if (frect.contains(p.x, p.y)){
                return true;
            }
        }
        return false;
    }

    /**
     * 返回线跟圆的交点
     * @param	p1  点1
     * @param	p2  点2
     * @param	c   圆心
     * @param	r   半径
     * @return  两个交点
     */
    private function getNode(p1:Point, p2:Point, c:Point, r:Number):Array{
        var x1:Number;
        var x2:Number;
        var y1:Number;
        var y2:Number;

        var po1:Point = new Point(0,0);
        var po2:Point = new Point(0,0);
        if (p2.x - p1.x == 0){
            x1 = p1.x;
            x2 = p1.x;
            y1 = Math.pow(r*r-Math.pow((p1.x-c.x),2),1/2)+c.y;//下面点
            y2 = -Math.pow(r*r-Math.pow((p1.x-c.x),2),1/2)+c.y;//上面点
        }else{
            var k:Number = (p2.y-p1.y)/(p2.x-p1.x);
            var b:Number = p1.y-(p2.y-p1.y)/(p2.x-p1.x)*p1.x;
            var m:Number = b-c.y;
            var val = -2*m*k*c.x- k*k*c.x*c.x+k*k*r*r-m*m+r*r;
            x1 = ((c.x-m*k)- Math.pow(val,1/2))/(k*k+1)//左边点
            y1 = k*x1+b;

            x2 = ((c.x-m*k)+ Math.pow(val,1/2))/(k*k+1)//右边点
            y2 = k*x1+b;
        }

        po1.setTo(x1, y1);
        po2.setTo(x2, y2);

        return [po1,po2];
    }


    private function boomHit():Boolean
    {

    }
    

}
}
