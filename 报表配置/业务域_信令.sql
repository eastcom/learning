//VOLTE_省_天



//4G_地市_重点小类_服务器IP_错误码_5分钟
<jdbcType name="discteteTime" type="array-char" />
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">IPMSDW.DW_FT_SE_4G_AR_APP_L3_IP_EC_5M</if>
</select>

<select id="resultMapping">
    --CITY_ID=地市 --PROVINCE_ID=编号 --STARTTIME=开始时间 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --APP_SERVER_IP=应用服务器IP --FAILCODE=错误码 --COUNTNBR=错误码次数
</select>

SELECT 
  to_char(to_date(substr(starttime,0,12),'yyyy-MM-dd HH24:mi:ss'),'yyyy-MM-dd HH24:mi:ss') STARTTIME,
  CITY_ID,
  PROVINCE_ID,
  SERVICE_ID,
  SUBSERVICE_ID,
  APP_SERVER_IP,
  FAILCODE,
  COUNTNBR
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and substr(STARTTIME,0,12) in (#discteteTime#)
</if>

//4G_地市_重点小类_服务器IP_5分钟
<jdbcType name="discteteTime" type="array-char" />
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">IPMSDW.DW_FT_SE_4G_AR_APP_L3_IP_5M</if>
</select>

<select id="resultMapping">
    --CITY_ID=地市 --PROVINCE_ID=编号 --STARTTIME=开始时间 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --APP_SERVER_IP=应用服务器IP --HTTPSUCCNBR=http访问成功次数(次) --HTTPATTNBR=http访问请求次数(次) --HTTPSUCCRATE=http访问成功率(%) --HTTPTOTALRESPTIME=http响应总时延（ms） --HTTPAVGRESPTIME=http平均响应时延（ms） --ULTRAFFIC=总上行流量(Byte) --BIGDATADLTRAFFIC=大流量（包>500KB)总下行流量(Byte) --DLTRAFFIC=总下行流量(Byte) --HTTPAVGDLRATE=http平均下载速率(kbps) --BIGDATADLRATE=http平均下载速率(包>500KB）(kbps) --ACTIVEUSERNBR=在线用户数(个)
</select>

SELECT 
  to_char(to_date(substr(starttime,0,12),'yyyy-MM-dd HH24:mi:ss'),'yyyy-MM-dd HH24:mi:ss') STARTTIME,
  CITY_ID,
  PROVINCE_ID,
  SERVICE_ID,
  SUBSERVICE_ID,
  APP_SERVER_IP,
  HTTPSUCCNBR,
  HTTPATTNBR,
  HTTPSUCCRATE,
  HTTPTOTALRESPTIME,
  HTTPAVGRESPTIME,
  ULTRAFFIC,
  BIGDATADLTRAFFIC,
  DLTRAFFIC,
  HTTPAVGDLRATE,
  BIGDATADLRATE,
  ACTIVEUSERNBR
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and substr(STARTTIME,0,12) in (#discteteTime#)
</if>

//服务器IP_互联网公司
<jdbcType name="discteteTime" type="array-char" />
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">IPMSDW.DW_FT_SE_4G_AR_APP_L3_IP_OL_5M</if>
</select>

<select id="resultMapping">
    --CITY_ID=地市 --PROVINCE_ID=编号 --STARTTIME=开始时间 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --APP_SERVER_IP=应用服务器IP --HTTPSUCCNBR=http访问成功次数(次) --HTTPATTNBR=http访问请求次数(次) --HTTPSUCCRATE=http访问成功率(%) --HTTPTOTALRESPTIME=http响应总时延（ms） --HTTPAVGRESPTIME=http平均响应时延（ms） --ULTRAFFIC=总上行流量(Byte) --BIGDATADLTRAFFIC=大流量（包>500KB)总下行流量(Byte) --DLTRAFFIC=总下行流量(Byte) --HTTPAVGDLRATE=http平均下载速率(kbps) --BIGDATADLRATE=http平均下载速率(包>500KB）(kbps) --ACTIVEUSERNBR=在线用户数(个)
</select>

SELECT 
  to_char(to_date(substr(starttime,0,12),'yyyy-MM-dd HH24:mi:ss'),'yyyy-MM-dd HH24:mi:ss') STARTTIME,
  CITY_ID,
  PROVINCE_ID,
  SERVICE_ID,
  SUBSERVICE_ID,
  APP_SERVER_IP,
  HTTPSUCCNBR,
  HTTPATTNBR,
  HTTPSUCCRATE,
  HTTPTOTALRESPTIME,
  HTTPAVGRESPTIME,
  ULTRAFFIC,
  BIGDATADLTRAFFIC,
  DLTRAFFIC,
  HTTPAVGDLRATE,
  BIGDATADLRATE,
  ACTIVEUSERNBR
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and substr(STARTTIME,0,12) in (#discteteTime#)
</if>

//服务器IP_咪咕
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">IPMSDW.DW_FT_SE_4G_AR_APP_L3_IP_MG_5M</if>
</select>

<select id="resultMapping">
    --CITY_ID=地市 --PROVINCE_ID=编号 --STARTTIME=开始时间 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --APP_SERVER_IP=应用服务器IP --HTTPSUCCNBR=http访问成功次数(次) --HTTPATTNBR=http访问请求次数(次) --HTTPSUCCRATE=http访问成功率(%) --HTTPTOTALRESPTIME=http响应总时延（ms） --HTTPAVGRESPTIME=http平均响应时延（ms） --ULTRAFFIC=总上行流量(Byte) --BIGDATADLTRAFFIC=大流量（包>500KB)总下行流量(Byte) --DLTRAFFIC=总下行流量(Byte) --HTTPAVGDLRATE=http平均下载速率(kbps) --BIGDATADLRATE=http平均下载速率(包>500KB）(kbps) --ACTIVEUSERNBR=在线用户数(个)
</select>

SELECT 
  to_char(to_date(substr(starttime,0,12),'yyyy-MM-dd HH24:mi:ss'),'yyyy-MM-dd HH24:mi:ss') STARTTIME,
  CITY_ID,
  PROVINCE_ID,
  SERVICE_ID,
  SUBSERVICE_ID,
  APP_SERVER_IP,
  HTTPSUCCNBR,
  HTTPATTNBR,
  HTTPSUCCRATE,
  HTTPTOTALRESPTIME,
  HTTPAVGRESPTIME,
  ULTRAFFIC,
  BIGDATADLTRAFFIC,
  DLTRAFFIC,
  HTTPAVGDLRATE,
  BIGDATADLRATE,
  ACTIVEUSERNBR
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and substr(STARTTIME,0,12) in (#discteteTime#)
</if>

//IP地址[NRT]_小时
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_SE_4G_AR_APP_L3_IP_H</if>
</select>

<select id="resultMapping">
    --CITY_ID=地市 --PROVINCE_ID=编号 --STARTTIME=开始时间 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --APP_SERVER_IP=应用服务器IP --HTTPSUCCNBR=http访问成功次数(次) --HTTPATTNBR=http访问请求次数(次) --HTTPSUCCRATE=http访问成功率(%) --HTTPTOTALRESPTIME=http响应总时延（ms） --HTTPAVGRESPTIME=http平均响应时延（ms） --ULTRAFFIC=总上行流量(Byte) --BIGDATADLTRAFFIC=大流量（包>500KB)总下行流量(Byte) --DLTRAFFIC=总下行流量(Byte) --HTTPAVGDLRATE=http平均下载速率(kbps) --BIGDATADLRATE=http平均下载速率(包>500KB）(kbps) --ACTIVEUSERNBR=在线用户数(个)
</select>

SELECT 
  to_char(to_date(substr(starttime,0,12),'yyyy-MM-dd HH24:mi:ss'),'yyyy-MM-dd HH24') STARTTIME,
  CITY_ID,
  PROVINCE_ID,
  SERVICE_ID,
  SUBSERVICE_ID,
  APP_SERVER_IP,
  HTTPSUCCNBR,
  HTTPATTNBR,
  HTTPSUCCRATE,
  HTTPTOTALRESPTIME,
  HTTPAVGRESPTIME,
  ULTRAFFIC,
  BIGDATADLTRAFFIC,
  DLTRAFFIC,
  HTTPAVGDLRATE,
  BIGDATADLRATE,
  ACTIVEUSERNBR
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and substr(STARTTIME,0,12) in (#discteteTime#)
</if>

// 错误码[NRT]_小时
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_SE_4G_AR_APP_L3_IP_EC_H</if>
</select>

<select id="resultMapping">
    --CITY_ID=地市 --PROVINCE_ID=编号 --STARTTIME=开始时间 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --APP_SERVER_IP=应用服务器IP --FAILCODE=错误码 --COUNTNBR=错误码次数
</select>

SELECT 
  to_char(to_date(substr(starttime,0,12),'yyyy-MM-dd HH24:mi:ss'),'yyyy-MM-dd HH24') STARTTIME,
  CITY_ID,
  PROVINCE_ID,
  SERVICE_ID,
  SUBSERVICE_ID,
  APP_SERVER_IP,
  FAILCODE,
  COUNTNBR
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and substr(STARTTIME,0,12) in (#discteteTime#)
</if>