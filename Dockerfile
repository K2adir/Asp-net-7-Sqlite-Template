﻿FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Net7Sqlite.csproj", "./"]
RUN dotnet restore "Net7Sqlite.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "Net7Sqlite.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Net7Sqlite.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Net7Sqlite.dll"]
