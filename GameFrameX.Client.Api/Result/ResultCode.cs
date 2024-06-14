namespace GameFrameX.Client.Api.Result
{
    /// <summary>
    /// 消息码常量定义
    /// </summary>
    public enum ResultCode
    {
        /// <summary>
        /// 成功
        /// </summary>
        Ok = 0,

        /// <summary>
        /// 没有找到
        /// </summary>
        NotFound = 200001,

        /// <summary>
        /// 账号或密码错误
        /// </summary>
        AccountOrPasswordError = 602004,
    }
}