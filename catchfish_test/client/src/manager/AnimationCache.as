package client.src.manager {
import laya.display.Animation;

public class AnimationCache {
    private static var _instance:AnimationCache;
    public function AnimationCache() {
    }
    public static function get instance():AnimationCache
    {
        return _instance||=new AnimationCache();
    }


    public function init():void
    {
        seaweedCache();
        cannonCache();
        bulletCache();
        fishCache();
        coinCache();
        toolCache();
    }

    private function toolCache():void
    {
        //bomb
        Animation.createFrames("res/atlas/fish/tools/boom.atlas", "pop_boom_eat");
        Animation.createFrames(["fish/tools/boom/boom0001.png"], "pop_boom_normal");

        //宝箱
        Animation.createFrames(["fish/tools/bx.png"], "pop_box_normal");
        Animation.createFrames(["fish/tools/bx.png"], "pop_box_eat");

        //力量
        Animation.createFrames(["fish/tools/power.png"], "pop_power_normal");
        Animation.createFrames(["fish/tools/power.png"], "pop_power_eat");

        //鱼饵
        Animation.createFrames(["fish/tools/fishfood.png"], "pop_food_normal");
        Animation.createFrames(["fish/tools/fishfood.png"], "pop_food_eat");
    }

    private function coinCache():void
    {
        Animation.createFrames("res/atlas/fish/money/coin.atlas", "coin");
        Animation.createFrames("res/atlas/fish/money/silver.atlas", "silver");
    }




    private function fishCache():void
    {
        Animation.createFrames("res/atlas/fish/fishimg/fish1/live.atlas","fish_live_1");
        Animation.createFrames("res/atlas/fish/fishimg/fish2/live.atlas","fish_live_2");
        Animation.createFrames("res/atlas/fish/fishimg/fish3/live.atlas","fish_live_3");
        Animation.createFrames("res/atlas/fish/fishimg/fish4/live.atlas","fish_live_4");
        Animation.createFrames("res/atlas/fish/fishimg/fish5/live.atlas","fish_live_5");
        Animation.createFrames("res/atlas/fish/fishimg/fish6/live.atlas","fish_live_6");
        Animation.createFrames("res/atlas/fish/fishimg/fish7/live.atlas","fish_live_7");
        Animation.createFrames("res/atlas/fish/fishimg/fish8/live.atlas","fish_live_8");
        Animation.createFrames("res/atlas/fish/fishimg/fish9/live.atlas","fish_live_9");
        Animation.createFrames("res/atlas/fish/fishimg/fish10/live.atlas","fish_live_10");
        Animation.createFrames("res/atlas/fish/fishimg/fish11/live.atlas","fish_live_11");
        Animation.createFrames("res/atlas/fish/fishimg/fish12/live.atlas","fish_live_12");

        Animation.createFrames("res/atlas/fish/fishimg/fish1/dead.atlas","fish_dead_1");
        Animation.createFrames("res/atlas/fish/fishimg/fish2/dead.atlas","fish_dead_2");
        Animation.createFrames("res/atlas/fish/fishimg/fish3/dead.atlas","fish_dead_3");
        Animation.createFrames("res/atlas/fish/fishimg/fish4/dead.atlas","fish_dead_4");
        Animation.createFrames("res/atlas/fish/fishimg/fish5/dead.atlas","fish_dead_5");
        Animation.createFrames("res/atlas/fish/fishimg/fish6/dead.atlas","fish_dead_6");
        Animation.createFrames("res/atlas/fish/fishimg/fish7/dead.atlas","fish_dead_7");
        Animation.createFrames("res/atlas/fish/fishimg/fish8/dead.atlas","fish_dead_8");
        Animation.createFrames("res/atlas/fish/fishimg/fish9/dead.atlas","fish_dead_9");
        Animation.createFrames("res/atlas/fish/fishimg/fish10/dead.atlas","fish_dead_10");
        Animation.createFrames("res/atlas/fish/fishimg/fish11/dead.atlas","fish_dead_11");
        Animation.createFrames("res/atlas/fish/fishimg/fish12/dead.atlas","fish_dead_12");
    }

    private function bulletCache():void
    {
        Animation.createFrames(["fish/bullet/bullet1/bullet0001.png"],"bullet_fly_1");
        Animation.createFrames(["fish/bullet/bullet2/bullet20001.png"],"bullet_fly_2");
        Animation.createFrames(["fish/bullet/bullet3/bullet30001.png"],"bullet_fly_3");
        Animation.createFrames(["fish/bullet/bullet4/bullet40001.png"],"bullet_fly_4");
        Animation.createFrames(["fish/bullet/bullet5/bullet50001.png"],"bullet_fly_5");
        Animation.createFrames(["fish/bullet/bullet6/bullet60001.png"],"bullet_fly_6");
        Animation.createFrames(["fish/bullet/bullet7/bullet70001.png"],"bullet_fly_7");
        Animation.createFrames(["fish/bullet/bullet8/bullet80001.png"],"bullet_fly_8");
        Animation.createFrames(["fish/bullet/bullet9/bullet90001.png"],"bullet_fly_9");

        Animation.createFrames("res/atlas/fish/bullet/bullet1.atlas","bullet_boom_1");
        Animation.createFrames("res/atlas/fish/bullet/bullet2.atlas","bullet_boom_2");
        Animation.createFrames("res/atlas/fish/bullet/bullet3.atlas","bullet_boom_3");
        Animation.createFrames("res/atlas/fish/bullet/bullet4.atlas","bullet_boom_4");
        Animation.createFrames("res/atlas/fish/bullet/bullet5.atlas","bullet_boom_5");
        Animation.createFrames("res/atlas/fish/bullet/bullet6.atlas","bullet_boom_6");
        Animation.createFrames("res/atlas/fish/bullet/bullet7.atlas","bullet_boom_7");
        Animation.createFrames("res/atlas/fish/bullet/bullet8.atlas","bullet_boom_8");
        Animation.createFrames("res/atlas/fish/bullet/bullet9.atlas","bullet_boom_9");

        Animation.createFrames("res/atlas/fish/effect/flash.atlas", "effect_flash");
    }

    private function seaweedCache():void
    {
        Animation.createFrames("res/atlas/fish/seaweed/seaweed1.atlas","seaweed1");
        Animation.createFrames("res/atlas/fish/seaweed/seaweed2.atlas","seaweed2");
        Animation.createFrames("res/atlas/fish/seaweed/seaweed3.atlas","seaweed3");
        Animation.createFrames("res/atlas/fish/seaweed/seaweed4.atlas","seaweed4");
    }

    private function cannonCache():void
    {
        Animation.createFrames(["fish/cannon/cannon1/cannon10001.png"],"cannon_normal_1");
        Animation.createFrames("res/atlas/fish/cannon/cannon1.atlas","cannon_fight_1");

        Animation.createFrames(["fish/cannon/cannon2/cannon20001.png"],"cannon_normal_2");
        Animation.createFrames("res/atlas/fish/cannon/cannon2.atlas","cannon_fight_2");

        Animation.createFrames(["fish/cannon/cannon3/cannon30001.png"],"cannon_normal_3");
        Animation.createFrames("res/atlas/fish/cannon/cannon3.atlas","cannon_fight_3");

        Animation.createFrames(["fish/cannon/cannon4/cannon40001.png"],"cannon_normal_4");
        Animation.createFrames("res/atlas/fish/cannon/cannon4.atlas","cannon_fight_4");

        Animation.createFrames(["fish/cannon/cannon5/cannon50001.png"],"cannon_normal_5");
        Animation.createFrames("res/atlas/fish/cannon/cannon5.atlas","cannon_fight_5");

        Animation.createFrames(["fish/cannon/cannon6/cannon60001.png"],"cannon_normal_6");
        Animation.createFrames("res/atlas/fish/cannon/cannon6.atlas","cannon_fight_6");

        Animation.createFrames(["fish/cannon/cannon7/cannon70001.png"],"cannon_normal_7");
        Animation.createFrames("res/atlas/fish/cannon/cannon7.atlas","cannon_fight_7");
    }
}
}
