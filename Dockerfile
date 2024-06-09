FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["GameFrameX.Client.Api/GameFrameX.Client.Api.csproj", "GameFrameX.Client.Api/"]
COPY ["GameFrameX.Application.Client.Api/GameFrameX.Application.Client.Api.csproj", "GameFrameX.Application.Client.Api/"]
COPY ["GameFrameX.Core.Options/GameFrameX.Core.Options.csproj", "GameFrameX.Core.Options/"]
COPY ["GameFrameX.Entity.Client/GameFrameX.Entity.Client.csproj", "GameFrameX.Entity.Client/"]
COPY ["GameFrameX.Entity/GameFrameX.Entity.csproj", "GameFrameX.Entity/"]
RUN dotnet restore "GameFrameX.Client.Api/GameFrameX.Client.Api.csproj"
COPY . .
WORKDIR "/src/GameFrameX.Client.Api"
RUN dotnet build "GameFrameX.Client.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build
# 安装ping工具
# RUN apt-get update && apt-get install -y iputils-ping

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "GameFrameX.Client.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GameFrameX.Client.Api.dll"]
