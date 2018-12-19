package laya.cloud 
{
	/**
	 * 服务器脚本基类
	 * @author jiayanzhao
	 */
	public class ServerScriptBase 
	{		
		public function ServerScriptBase() 
		{
			
		}
		/**
		 * 房间标识, 只读属性
		 */
		public function get name():String{
			return "";
		};
		/**
		 * 房主的userid, 只读属性
		 */
		public function get master():String{
			return "";
		};
		/**
		 * 当前房间帧速度, 只读属性
		 */
		public function get fps():int{
			return 0;
		};
		/**
		 * 帧同步持续时间秒, 只读属性
		 */
		public function get duration():int{
			return 0;
		};
		/**
		 * 当前房间内的玩家数量, 只读属性
		 */
		public function get usernum():int{
			return 0;
		};
		
		/**
		 * 获取房间内所有用户的用户ID
		 * @return 用户ID数组
		 */
		public final function getusersid():Array{
			return null;
		}
		
		/**
		 * 获取用户数据
		 * @param	userid 用户ID
		 * @return	用户数据
		 */
		public final function getuserdata(userid:String):Object{
			return null;
		}
		
		/**
		 * 保存用户数据
		 * @param	userid 用户ID
		 */
		public final function saveuserdata(userid:String):void{
			
		}
		/**
		 * 向房间内用户广播一条消息
		 * @param	data 要广播的消息字符串
		 */
		public final function broadcast(data:String):void{
			
		}
		/**
		 * 向指定用户发送一条事件
		 * @param	userid 接收事件的用户ID
		 * @param	key 事件的key
		 * @param	val 事件的value
		 */
		public final function send(userid:String, key:String, val:String):void{
			
		}
		/**
		 * 关闭房间
		 */
		public final function close():void{
			
		}
		
		/**
		 * 启动定时器, 此函数调用后会每隔1秒调用一次onupdate函数
		 * 如果需要停止定时器, 需要调用stopupdate函数
		 */
		public final function startupdate():void{
			
		}
		
		/**
		 * 停止定时器
		 */
		public final function stopupdate():void{
			
		}
		
		
	}

}