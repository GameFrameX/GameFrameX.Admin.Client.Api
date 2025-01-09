namespace GameFrameX.Client.Api.Result;

/// <summary>
/// 返回码扩展
/// </summary>
public static class ResultCodeExtension
{
    private static readonly Dictionary<HttpStatusCode, string> CodeDictionary = new Dictionary<HttpStatusCode, string>()
    {
        { HttpStatusCode.Ok, "ok" },
        { HttpStatusCode.AccountOrPasswordError, "账号或密码错误" },
    };

    /// <summary>
    /// 获取返回码的消息内容
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public static string GetString(this HttpStatusCode code)
    {
        CodeDictionary.TryGetValue(code, out var desc);
        return desc ?? string.Empty;
    }
}