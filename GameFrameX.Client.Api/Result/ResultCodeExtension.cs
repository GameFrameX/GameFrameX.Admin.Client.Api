namespace GameFrameX.Client.Api.Result
{
    /// <summary>
    /// 返回码扩展
    /// </summary>
    public static class ResultCodeExtension
    {
        private static readonly Dictionary<ResultCode, string> CodeDictionary = new Dictionary<ResultCode, string>()
        {
            { ResultCode.Ok, "ok" },
            { ResultCode.AccountOrPasswordError, "账号或密码错误" },
        };

        /// <summary>
        /// 获取返回码的消息内容
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public static string GetString(this ResultCode code)
        {
            CodeDictionary.TryGetValue(code, out var desc);
            return desc ?? string.Empty;
        }
    }
}