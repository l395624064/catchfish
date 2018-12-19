package laya.cloud 
{
	
	/**
	 * ...
	 * @author jiayanzhao
	 */
	public interface IServerScript 
	{		
		/**
		 * 当房间创建时被调用, this指针为room对象
		 */
		function oncreated():void;
		/**
		 * 当房主发送开始指令时被调用，指示房间开始帧同步
		 */
		function onstart():void;
		/**
		 * 房间关闭时被调用
		 */
		function onclose():void;
		/**
		 * 玩家进入房间时被调用
		 * @param	userid 进入房间的用户ID
		 * @param	data 进入房间的用户数据
		 */
		function onuserin(userid:String, data:Object):void;
		/**
		 * 玩家离开房间时被调用
		 * @param	userid
		 */
		function onuserout(userid:String):void;
		/**
		 * 当玩家发送自定义事件时被调用
		 * @param	userid 发送事件的用户ID
		 * @param	key 事件的key
		 * @param	val 事件的value
		 */
		function onuserevent(userid:String, key:String, val:String):void;
		
		/**
		 * 定时器启动后, 会每隔1秒调用1次onupdate函数 
		 */
		function onupdate():void;
	}
	
}