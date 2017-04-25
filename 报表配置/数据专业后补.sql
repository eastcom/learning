//数据网日汇总
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>   
</select>


<select id="resultMapping">
 --START_TIME=开始时间 --SUBMIT_NUM=MMS发送总条数 --RATIO=全天彩信接通率(%) --MMS_TOTAL_NETWORK_SUCC_RATIO=彩信网全程接通率(%) --TMNL_SUBMIT_MMS_NUM=终端发送MMS条数 --TMNL_DELV_MMS_NUM=终端接收MMS条数 --BUSY_TIME_AM_MMS1=彩信1上午忙时时间 --BUSY_TIME_AM_MMS_NUM_MMS1=彩信1上午MMS忙时并发请求数 --BUSY_TIME_PM_MMS1=彩信1下午忙时时间 --BUSY_TIME_PM_MMS_NUM_MMS1=彩信1MMS下午忙时并发请求数 --BUSY_TIME_MMS_NUM_MMS1=彩信1下载请求次数 --BUSY_TIME_AM_MMS2=彩信2上午忙时时间 --BUSY_TIME_AM_MMS_NUM_MMS2=彩信2上午MMS忙时并发请求数 --BUSY_TIME_PM_MMS2=彩信2下午忙时时间 --BUSY_TIME_PM_MMS_NUM_MMS2=彩信2MS下午忙时并发请求数 --BUSY_TIME_MMS_NUM_MMS2=彩信2下载请求次数 --TOTALDOWNLOAD_REQS=总下载请求次数 --DOWNLOADSUCCESSRATE=下载请求成功率(%) --TOTALVOD_REQS=总点播次数 --VODSUCCESSRATE=点播成功率(%) --TOTALLIVING_REQS=总直播次数 --LIVINGSUCCESSRATE=直播成功率(%) --TRY_CNT=全天定位尝试总数 --SUCC_RATIO=全天定位尝试成功率(%) --REGISTERUSERNUM=注册用户数 --MISC_RATIO=鉴权成功率(%) --RATE=企信通下发成功率 --MUSICRINGDOWNLOAD=铃声下载数 --MUSICRINGUSER=铃声用户数 --MUSICRINGSPACERATE=彩铃空间利用率(%) --DISKUSERRATE=硬盘利用率(%) --DBDISKUSERATE=数据库磁盘利用率(%) --AUTH_TOTAL=认证总数 --AUTH_SUCC_RATIO=认证成功率(%)
</select>

select 
to_char(START_TIME, 'yyyy-mm-dd') START_TIME,
SUBMIT_NUM,
RATIO,
MMS_TOTAL_NETWORK_SUCC_RATIO,
TMNL_SUBMIT_MMS_NUM,
TMNL_DELV_MMS_NUM,
BUSY_TIME_AM_MMS1,
BUSY_TIME_AM_MMS_NUM_MMS1,
BUSY_TIME_PM_MMS1,
BUSY_TIME_PM_MMS_NUM_MMS1,
BUSY_TIME_MMS_NUM_MMS1,
BUSY_TIME_AM_MMS2,
BUSY_TIME_AM_MMS_NUM_MMS2,
BUSY_TIME_PM_MMS2,
BUSY_TIME_PM_MMS_NUM_MMS2,
BUSY_TIME_MMS_NUM_MMS2,
TOTALDOWNLOAD_REQS,
DOWNLOADSUCCESSRATE,
TOTALVOD_REQS,
VODSUCCESSRATE,
TOTALLIVING_REQS,
LIVINGSUCCESSRATE,
TRY_CNT,
SUCC_RATIO,
REGISTERUSERNUM,
MISC_RATIO,
RATE,
MUSICRINGDOWNLOAD,
MUSICRINGUSER,
MUSICRINGSPACERATE,
DISKUSERRATE,
DBDISKUSERATE,
AUTH_TOTAL,
AUTH_SUCC_RATIO
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//CMNET出口数据统计报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_OUT_FLOW_D</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --MODULE_NAME=模板名称 --DAIKUAN=带宽(M) --IF_IN_TRAFFIC=流入均值速率(M) --MAX_IF_IN_TRAFFIC=流入峰值速率(M) --IF_IN_UTILITY=流入均值利用率(%) --MAX_IF_IN_UTILITY=流入峰值利用率(%) --IF_OUT_TRAFFIC=流出均值速率(M) --MAX_IF_OUT_TRAFFIC=流出峰值速率(M) --IF_OUT_UTILITY=流出均值利用率(%) --MAX_IF_OUT_UTILITY=流出峰值利用率(%) --LIURUZIJ=流入字节数(M) --LIUCUZIJ=流出字节数(M)
</select>

select 
to_char(TIME_STAMP, 'yyyy-mm-dd') TIME_STAMP,
MODULE_NAME,
DAIKUAN,
IF_IN_TRAFFIC,
MAX_IF_IN_TRAFFIC,
IF_IN_UTILITY,
MAX_IF_IN_UTILITY,
IF_OUT_TRAFFIC,
MAX_IF_OUT_TRAFFIC,
IF_OUT_UTILITY,
MAX_IF_OUT_UTILITY,
LIURUZIJ,
LIUCUZIJ
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_STAMP in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//CMNET日汇总报表

//互联网质量日报报表2
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_INTERNET_QUALITY_2_D</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --VALUE1=指标名称 --VALUE2=指标值
</select>

select 
to_char(TIME_STAMP, 'yyyy-mm-dd') TIME_STAMP,
VALUE1,
VALUE2
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_STAMP in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//互联网质量日报报表1
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_INTERNET_QUALITY_1_D</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --LINK_NAME=链路名称 --BANDWIDTH=实际带宽(M) --MAX_IF_TRAFFIC=峰值流速(M) --MAX_IF_UTILITY=峰值带宽利用率(%) --WORST_MAX_IF_TRAFFIC=最差链路峰值(M) --WORST_MAX_IF_UTILITY=最差峰值带宽利用率(%) --WORST_PACKET_LOSS=最差链路丢包率(%) --WORST_PACKET_DELAY=最差链路时延(ms) --PACKET_LOSS=忙时丢包率(%) --PACKET_DELAY=忙时时延(ms)
</select>

select 
to_char(TIME_STAMP, 'yyyy-mm-dd') TIME_STAMP,
LINK_NAME,
BANDWIDTH,
MAX_IF_TRAFFIC,
MAX_IF_UTILITY,
WORST_MAX_IF_TRAFFIC,
WORST_MAX_IF_UTILITY,
WORST_PACKET_LOSS,
WORST_PACKET_DELAY,
PACKET_LOSS,
PACKET_DELAY
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_STAMP in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//每周跟踪指标报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='week' ">IPMSDM.DM_CMNET_TRACKING_W</if>   
</select>


<select id="resultMapping">
 --CMNPD01=开始时间 --CITY_IN=地市入流量gbps --GG_OUT=骨干出口流量gbps --GG_UNITITY=骨干流量占比 --GJ_OUT=国际出口流量gbps --GJ_UNITITY=国际流量占比 --DSF_OUT=第三方出口流量gbps --DSF_UNITITY=第三方流量占比 --NET_RATE=本网率 --IDC_VALUE_IN=idc他网入流速gbps --CACHE_YOUXIAO_UNITITY=cache有效缓存比(含福建灵点) --DOWN_DELAY_TOP200=省内top200热点网站页面打开时延(s) --SITE_RATE_TOP200=省内top200热点网站下载速率(mbps) --DNS_DELAY=互联网 dns查询时延(ms) --WEB_OPEN_DELAY=cache站点http页面提取时延(s) --CACHE_HTTP_RATE=cache站点http下载速率(mbps) --VALUE_1=备用字段1 --VALUE_2=备用字段2 --VALUE_3=备用字段3 --VALUE_4=备用字段4 --VALUE_5=备用字段5 --VALUE_6=备用字段6 --VALUE_7=备用字段7 --VALUE_8=备用字段8 --VALUE_9=备用字段9 --VALUE_10=备用字段10 --VALUE_11=备用字段11 --VALUE_12=备用字段12 --VALUE_13=备用字段13 --VALUE_14=备用字段14 --VALUE_15=备用字段15 --VALUE_16=备用字段16 --VALUE_17=备用字段17 --VALUE_18=备用字段18 --VALUE_19=备用字段19 --VALUE_20=备用字段20
</select>

select 
CMNPD01,
round(CITY_IN,2) CITY_IN,
round(GG_OUT,2) GG_OUT,
round(GG_UNITITY,2) GG_UNITITY,
round(GJ_OUT,2) GJ_OUT,
round(GJ_UNITITY,2) GJ_UNITITY,
round(DSF_OUT,2) DSF_OUT,
round(DSF_UNITITY,2) DSF_UNITITY,
round(NET_RATE,2) NET_RATE,
round(IDC_VALUE_IN,2) IDC_VALUE_IN,
round(CACHE_YOUXIAO_UNITITY,2) CACHE_YOUXIAO_UNITITY,
round(DOWN_DELAY_TOP200,2) DOWN_DELAY_TOP200,
round(SITE_RATE_TOP200,2) SITE_RATE_TOP200,
round(DNS_DELAY,2) DNS_DELAY,
round(WEB_OPEN_DELAY,2) WEB_OPEN_DELAY,
round(CACHE_HTTP_RATE,2) CACHE_HTTP_RATE,
round(VALUE_1,2) VALUE_1,
round(VALUE_2,2) VALUE_2,
round(VALUE_3,2) VALUE_3,
round(VALUE_4,2) VALUE_4,
round(VALUE_5,2) VALUE_5,
round(VALUE_6,2) VALUE_6,
round(VALUE_7,2) VALUE_7,
round(VALUE_8,2) VALUE_8,
round(VALUE_9,2) VALUE_9,
round(VALUE_10,2) VALUE_10,
round(VALUE_11,2) VALUE_11,
round(VALUE_12,2) VALUE_12,
round(VALUE_13,2) VALUE_13,
round(VALUE_14,2) VALUE_14,
round(VALUE_15,2) VALUE_15,
round(VALUE_16,2) VALUE_16,
round(VALUE_17,2) VALUE_17,
round(VALUE_18,2) VALUE_18,
round(VALUE_19,2) VALUE_19,
round(VALUE_20,2) VALUE_20
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and substr(CMNPD01,0,4) || substr(CMNPD01,6,7) in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,6)
</jdbcType>

//bras地址报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='week' ">IPMSDM.DM_CMNET_BRAS_W</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --DEVICE_NAME=设备名称 --AGENT_DESC=ip地址 --ALL_ADDR_INPOOL=移动宽带地址个数 --DOMAIN_ONLINE_USER=移动宽带峰值用户数 --MAX_ADDR_RATE=移动宽带地址池峰值利用率(%) --MAX_ADDR_TIME=移动宽带忙时 --DOMAIN_ONLINE_USER2=移动宽带均值 --ALLADDRESSNUM=vpdn地址个数 --ONLINEUSERNUM=vpdn峰值用户数 --ADDRUSEDRATE=vpdn峰值地址池利用率(%) --MAX_TIME=vpdn忙时 --ONLINEUSERNUM2=vpdn均值
</select>

select 
to_char(TIME_STAMP, 'yyyy-iw') TIME_STAMP,
DEVICE_NAME,
AGENT_DESC,
ALL_ADDR_INPOOL,
DOMAIN_ONLINE_USER,
MAX_ADDR_RATE,
MAX_ADDR_TIME,
DOMAIN_ONLINE_USER2,
ALLADDRESSNUM,
ONLINEUSERNUM,
ADDRUSEDRATE,
MAX_TIME,
ONLINEUSERNUM2
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(TIME_STAMP,'yyyyiw') in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,6)
</jdbcType>

//上海CMNET出口分析报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='month' ">IPMSDM.DM_CMNET_EXPORTS_ANALYSIS_M</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --MODULE_NAME=出口类型 --DAIKUAN=带宽 --IF_IN_TRAFFIC=本月流入均值（Gbps) --SIF_IN_TRAFFIC=上月流入均值（Gbps) --CHAIN_GROWTH_IN=环比增长率%(流入) --IF_OUT_TRAFFIC=本月流出均值（Gbps) --SIF_OUT_TRAFFIC=上月流出均值（Gbps) --CHAIN_GROWTH_OUT=环比增长率%(流出) --MAX_IF_IN_TRAFFIC=本月流入峰值（Gbps) --SMAX_IF_IN_TRAFFIC=上月流入峰值（Gbps) --CHAIN_GROWTH_MIN=环比增长率%(峰值流入) --MAX_IF_OUT_TRAFFIC=本月流出峰值（Gbps) --SMAX_IF_OUT_TRAFFIC=上月流出峰值（Gbps) --CHAIN_GROWTH_MOUT=环比增长率%(峰值流) --UTILITY=峰值利用率(%)
</select>

select *
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(TIME_STAMP,'yyyyiw') in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,6)
</jdbcType>

//骨干第三方WEB流量
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_KG_WEBCACHE_D</if>   
</select>


<select id="resultMapping">
 --START_TIME=开始时间 --USERS=用户群 --FLOW_TYPE=流量类型(骨干/第三方) --P2P_DOWNLOAD=p2p下载(mbps) --P2P_STREAM_MEDIA=p2p流媒体(mbps) --STREAM_MEDIA=流媒体(mbps) --BROWSE=浏览(mbps) --DOWNLOAD=下载(mbps)
</select>

select 
to_char(START_TIME,'yyyy-mm-dd') START_TIME,
USERS,
FLOW_TYPE,
P2P_DOWNLOAD,
P2P_STREAM_MEDIA,
STREAM_MEDIA,
BROWSE,
DOWNLOAD
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//东方有线vpdn用户数报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_KG_WEBCACHE_D</if>   
</select>


<select id="resultMapping">
 --STATSTIME=时间 --START_TIME=开始时间 --DATASOURCEID=资源编码 --END_TIME=结束时间 --STATSLEVEL=采集粒度 --TASK_ID=采集任务ID --INDEX_ID=索引ID --ALLUSERNUM=该域下的所有用户数 --ONLINEUSERNUM=该域下目前在线用户数 --PPPONLINEUSERNUM=该域下目前在线PPP用户数目 --DOWNBYTENUM --域流量的下行字节数(KB) --DOWNMESSAGESNUM=域流量的下行报文个数 --UPBYTENUM=域流量的上行字节数(KB) --UPMESSAGESNUM=域流量的上行报文个数 --ALLADDRESSNUM=该地址池中配置的总地址数 --USEDADDRESSNUM=已使用地址数 --CONFLICTADDRESSNUM=冲突的地址数 --EDUCTIONADDRNUM=已引出的地址数 --FREEADDRNUM=空闲的地址数 --ADDRUSEDRATE=地址占用率 --SERVICE_CODE=服务编码
</select>

select *
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//RADIUS业务CPU内存利用率
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_CMNET_KG_WEBCACHE_D</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --UUID=主机名称 --DEVICE_UUID=设备名称 --CPU_UTILITY=CPU利用率 --MAX_CPU_UTILITY=CPU最大利用率 --MEM_UTILITY=内存利用率 --MAX_MEM_UTILITY=内存最大利用率 --SESSION_NUM=并发数 --MAX_SESSION_NUM=最大并发数
</select>

select 
to_char(TIME_STAMP,'yyyy-mm-dd HH24') TIME_STAMP,
UUID,
DEVICE_UUID,
CPU_UTILITY,
MAX_CPU_UTILITY,
MEM_UTILITY,
MAX_MEM_UTILITY,
SESSION_NUM,
MAX_SESSION_NUM
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_STAMP in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//MSTP大颗粒&&城域网专线数量统计周报-OLT专线
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='week' ">IPMSDM.DM_CMNET_MSTP_MAN_OLT_W</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --SYS_NAME=系统名称 --LAG_NAME=LAG名称 --LINE_NUM=专线数量
</select>

select 
to_char(TIME_STAMP,'yyyy-iw') TIME_STAMP,
SYS_NAME,
LAG_NAME,
LINE_NUM,
IMS,
CTT,
WLAN,
DOOIOO
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(TIME_STAMP,'yyyyiw') in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-char">
	'@value'.substr(0,6)
</jdbcType>

//专用APN（华为）性能指标统计报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_GPRS_PGW_APN_D</if>   
</select>


<select id="resultMapping">
 --BEGINTIME=开始时间 --ENDTIME=结束时间 --MANAGEDELEMENT=设备名称 --INFOMODELREFERENCED=APN名称 --IP_POOL=IP地址 --IP_ADDRESSUSAGE=IP地址池利用率 --IP_GIDOWNLINKTRAFFIC23G=23G网络GI上行流量 --IP_GIUPLINKTRAFFIC23G=23G网络GI下行流量 --IP_SGIDOWNLINKTRAFFIC4G=4G网络SGI下行流量 --IP_SGIUPLINKTRAFFIC4G=4G网络SGI上行流量 --SM_CREATEPDPREQ23G=23G网络PDP激活请求次数 --SM_CREATEPDPSUC23G=23G网络PDP激活成功次数 --SM_CREATEPDPSUCRATIO23G=23G网络PDP激活成功率(%) --SM_CURRENTPDP4G=4G网络在线用户数 --SM_CURRENTSUBSCRIBERS4G=4G网络专有承载请求次数 --SM_DEDICATEDBEARERREQ4G=4G网络专有承载请求次数 --SM_DEDICATEDBEARERSUC4G=4G网络专有承载成功次数 --SM_DEDICATEDBEARERSUCRATIO4G=4G网络专有承载成功率(%) --SM_DEFAULTBEARERREQ4G=4G网络默认承载建立请求次数 --SM_DEFAULTBEARERSUC4G=4G网络默认承载建立成功次数 --SM_DEFAULTBEARERSUCRATIO4G=4G网络默认承载成功率(%) --SM_MAXPDP4G=4G网络PDP峰值在线用户数 --SM_MAXSUBSCRIBERS4G=4G网络峰值请求次数
</select>

select 
to_char(BEGINTIME, 'yyyy-mm-dd') BEGINTIME,
to_char(ENDTIME,'yyyy-mm-dd') ENDTIME,
MANAGEDELEMENT,
INFOMODELREFERENCED,
DNPREFIX,
SENDERNAME,
VENDORNAME,
JOBID,
OBJECTTYPE,
PM_DN,
PM_USERLABEL,
IP_POOL,
IP_ADDRESSUSAGE,
IP_GIDOWNLINKTRAFFIC23G,
IP_GIUPLINKTRAFFIC23G,
IP_SGIDOWNLINKTRAFFIC4G,
IP_SGIUPLINKTRAFFIC4G,
SM_CREATEPDPREQ23G,
SM_CREATEPDPSUC23G,
SM_CREATEPDPSUCRATIO23G,
SM_CURRENTPDP4G,
SM_CURRENTSUBSCRIBERS4G,
SM_DEDICATEDBEARERREQ4G,
SM_DEDICATEDBEARERSUC4G,
SM_DEDICATEDBEARERSUCRATIO4G,
SM_DEFAULTBEARERREQ4G,
SM_DEFAULTBEARERSUC4G,
SM_DEFAULTBEARERSUCRATIO4G,
SM_MAXPDP4G,
SM_MAXSUBSCRIBERS4G
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and BEGINTIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//MME性能统计报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_SGSNFUCTION_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_GPRS_PGW_APN_D</if>   
</select>


<select id="resultMapping">
 --BEGINTIME=开始时间 --ENDTIME=结束时间 --INFOMODELREFERENCED=信息模型标准 --DNPREFIX=子网dn前缀 --SENDERNAME=发送名称 --VENDORNAME=设备供应商 --JOBID=任务id --OBJECTTYPE=指标组 --PM_DN=对象识别名 --PM_USERLABEL=标签 --SM_ATTACTPDPCONTEXT=ms激活会话请求次数 --SM_SUCCACTPDPCONTEXT=ms激活会话成功次数 --SM_FAILACTPDPCTXTMSUSERCAUSE=用户原因导致的ms激活会话失败次数 --SM_FAILACTPDPCTXTMSUSERCAUSE27=未知apn导致的ms激活会话失败次数 --SM_FAILACTPDPCTXTMSUSERCAUSE28=未知pdp地址或pdp地址类型导致的ms激活会话失败次数 --SM_FAILACTPDPCTXTMSUSERCAUSE29=用户鉴权失败导致的ms激活会话失败次数 --SM_FAILACTPDPCTXTMSUSERCAUSE32=业务不支持导致的ms激活会话失败次数 --SM_FAILACTPDPCTXTMSUSERCAUSE33=业务未签约导致的ms激活会话失败次数 --SM_ATTACTPDPCONTEXTSTATIC=使用静态地址激活会话请求次数 --SM_SUCCACTPDPCONTEXTSTATIC=使用静态地址激活会话成功次数 --SM_MEANACTPDPCONTEXT=会话平均数 --SM_MEANACTPDPCONTEXTWITHDT=直接隧道会话平均数 --SM_MAXACTPDPCONTEXT=会话最大数 --SM_ATTDEACTPDPCONTEXTSGSN=sgsn去激活会话请求次数 --SM_SUCCDEACTPDPCONTEXTSGSN=sgsn去激活会话的成功次数 --SM_ATTDEACTPDPCONTEXTMS=ms去激活会话请求次数 --SM_SUCCDEACTPDPCONTEXTMS=ms去激活会话成功次数 --SM_ATTDEACTPDPCONTEXTGGSN=ggsn去激活会话请求次数 --SM_SUCCDEACTPDPCONTEXTGGSN=ggsn去激活会话成功次数 --SM_ATTACTSECONDPDPCONTEXT=二次激活请求次数 --SM_SUCCACTSECONDPDPCONTEXT=二次激活成功次数 --SM_ATTMODPDPCONTEXTMS=ms修改会话请求次数 --SM_SUCCMODPDPCONTEXTMS=ms修改会话成功次数 --SM_ATTMODPDPCONTEXTSGSN=sgsn修改会话的请求次数 --SM_SUCCMODPDPCONTEXTSGSN=sgsn修改会话的成功次数 --SM_ATTUPDPDPCONTEXTGGSN=ggsn更新会话请求次数 --SM_SUCCUPDPDPCONTEXTGGSN=ggsn更新会话成功次数 --SM_ATTUPDPDPCONTEXTSGSN=sgsn更新会话请求次数 --SM_SUCCUPDPDPCONTEXTSGSN=sgsn更新会话成功次数 --SM_ATTACTPDPCONTEXT_RAI=每路由区ms激活会话请求次数 --SM_SUCCACTPDPCONTEXT_RAI=每路由区ms激活会话成功次数 --SM_MEANACTPDPCONTEXT_RAI=每路由区会话平均数 --SM_MAXACTPDPCONTEXT_RAI=每路由区会话最大数 --SM_MEANACTPDPCONTEXT_NSEI=每nse会话平均数 --SM_MEANACTPDPCONTEXT_RNCID=每rnc会话平均数 --MAP_ATTSENDAUTHINFOHLR=发送鉴权信息请求尝试次数 --MAP_SUCCSENDAUTHINFOHLR=发送鉴权信息成功次数 --MM_ATTGPRSATTACH=gprs附着请求次数 --MM_SUCCGPRSATTACH=gprs附着成功次数 --MM_FAILEDGPRSATTACHUSER=gprs附着用户原因失败次数 --MM_FAILEDGPRSATTACHUSER_3=原因为3的gprs附着用户原因失败次数 --MM_FAILEDGPRSATTACHUSER_6=原因为6的gprs附着用户原因失败次数 --MM_FAILEDGPRSATTACHUSER_7=原因为7的gprs附着用户原因失败次数 --MM_FAILEDGPRSATTACHUSER_8=原因为8的gprs附着用户原因失败次数 --MM_FAILEDGPRSATTACHUSER_14=原因为14的gprs附着用户原因失败次数 --MM_ATTGPRSDETACHMS=ms发起的gprs分离请求次数 --MM_ATTGPRSDETACHSGSN=sgsn发起的分离请求次数 --MM_SUCCGPRSDETACHSGSN=sgsn发起的分离成功次数 --MM_ATTGPRSDETACHHLR=hlr发起的分离请求次数 --MM_MEANNBRATTACHEDSUB=平均附着用户数 --MM_MEANNBRATTACHEDSUBSIM=平均附着sim用户数 --MM_MEANNBRATTACHEDSUBUSIM=平均附着usim用户数 --MM_MAXNBRATTACHEDSUB=最大附着用户数 --MM_ATTINTRASGSNRAU=sgsn内rau请求次数 --MM_SUCCINTRASGSNRAU=sgsn内rau成功次数 --MM_FAILINTRASGSNRAU=sgsn内rau失败次数 --MM_ATTINTRASGSNPERIODICRAU=sgsn内周期性rau请求次数 --MM_SUCCINTRASGSNPERIODICRAU=sgsn内周期性rau成功次数 --MM_ATTINTERSGSNRAU=sgsn间rau请求次数 --MM_SUCCINTERSGSNRAU=sgsn间rau成功次数 --MM_FAILINTERSGSNRAU=sgsn间rau失败次数 --MM_FAILINTERSGSNRAU_12=原因为12的sgsn间rau失败次数 --MM_FAILINTERSGSNRAU_14=原因为14的sgsn间rau失败次数 --MM_FAILINTERSGSNRAU_15=原因为15的sgsn间rau失败次数 --MM_ATTPSPAGINGPROCGB=2g分组寻呼请求次数 --MM_SUCCPSPAGINGPROCGB=2g分组寻呼成功次数 --MM_ATTPSPAGINGPROCIU=3g分组寻呼请求次数 --MM_SUCCPSPAGINGPROCIU=3g分组寻呼成功次数 --MM_ATTGPRSATTACH_RAI=每路由区gprs附着请求次数 --MM_SUCCGPRSATTACH_RAI=每路由区gprs附着成功次数 --MM_ATTGPRSDETACHMS_RAI=每路由区ms发起的gprs分离请求次数 --MM_ATTGPRSDETACHSGSN_RAI=每路由区sgsn发起的分离请求次数 --MM_SUCCGPRSDETACHSGSN_RAI=每路由区sgsn发起的分离成功次数 --MM_MEANNBRATTACHEDSUB_RAI=分路由区的平均附着用户数 --MM_MEANNBRATTACHEDSUBSIM_RAI=每路由区平均附着sim用户数 --MM_MEANNBRATTACHEDSUBUSIM_RAI=每路由区平均附着usim用户数 --MM_MAXNBRATTACHEDSUB_RAI=每路由区最大附着用户数 --MM_ATTINTRASGSNRAU_RAI=分路由区的sgsn内rau请求次数 --MM_SUCCINTRASGSNRAU_RAI=分路由区的sgsn内rau成功次数 --MM_ATTINTRASGSNPERIODICRAU_RAI=分路由区的sgsn内周期性rau请求次数 --MM_SUCCINTRASGSNPERIODICRAURAI=分路由区的sgsn内周期性rau成功次数 --MM_ATTINTERSGSNRAU_RAI=分路由区的sgsn间rau请求次数 --MM_SUCCINTERSGSNRAU_RAI=分路由区的sgsn间rau成功次数 --MM_ATTPSPAGINGPROCGB_RAI=每路由区2g分组寻呼请求次数 --MM_SUCCPSPAGINGPROCGB_RAI=每路由区2g分组寻呼成功次数 --MM_ATTPSPAGINGPROCIU_RAI=每路由区3g分组寻呼请求次数 --MM_SUCCPSPAGINGPROCIU_RAI=每路由区3g分组寻呼成功次数 --MM_MEANNBRATTACHEDSUB_NSEI=分nse的平均附着用户数 --MM_MEANNBRATTACHEDSUB_RNCID=分rnc的平均附着用户数 --MM_FAILINTERSGSNRAU_CAUSE=分原因的sgsn间rau失败次数 --MM_FAILINTRASGSNRAU_CAUSE=分原因的sgsn内rau失败次数 --RELOC_ATTINTERSGSN=3gsgsn之间服务rns重定位请求次数 --RELOC_SUCCINTERSGSN=3gsgsn之间服务rns重定位成功次数 --RELOC_ATTINTRASGSN=3gsgsn内部服务rns重定位请求次数 --RELOC_SUCCINTRASGSN=3gsgsn内部服务rns重定位成功次数 --RELOC_ATTCOMBIINTERSGSN=3gsgsn之间联合硬切换和服务srns重定位请求次数 --RELOC_SUCCCOMBIINTERSGSN=3gsgsn之间联合硬切换和服务srns重定位的成功次数 --RELOC_ATTCOMBIINTRASGSN=3gsgsn内部联合硬切换和服务srns重定位的请求次数 --RELOC_SUCCCOMBIINTRASGSN=3gsgsn内部联合硬切换和服务srns重定位的成功次数 --ISYSC_ATTINTRASGSNGSMUMTSRAU=sgsn内部从2g到3g切换请求的次数 --ISYSC_SUCCINTRASGSNGSMUMTSRAU=sgsn内部从2g到3g切换成功的次数 --ISYSC_ATTINTRASGSNUMTSGSMRAU=sgsn内部从3g到2g切换请求的次数 --ISYSC_SUCCINTRASGSNUMTSGSMRAU=sgsn内部从3g到2g切换成功的次数 --SEC_ATTAUTHPROCSSGSN=用户鉴权的请求次数 --SEC_SUCCAUTHPROCSSGSN=用户鉴权的成功次数 --SEC_ATTIDENTITYREQUEST=身份标识请求次数 --SEC_SUCCIDENTITYREQUEST=身份标识请求成功次数 --SEC_ATTSECMODE=3g加密模式控制请求次数（3g） --SEC_SUCCSECMODE=3g加密模式控制成功次数（3g） --GTPP_CDRTRANSFREQ=cdr信息传送请求次数 --GTPP_CDRTRANSFREQ_1=cdr信息传送请求次数--类型1 --GTPP_CDRTRANSFREQ_2=cdr信息传送请求次数--类型2 --GTPP_SUCCCDRTRANSF=cdr信息传送成功次数 --GTP_INPKTGN=gn口接收的gtp包数量 --GTP_OUTPKTGN=gn口发送的gtp包数量 --GTP_INOCTGN=gn口接收的gtp包字节数 --GTP_OUTOCTGN=gn口发送的gtp包字节数 --GTP_DISCPKTGN=gn口丢弃的gtp包数量 --GTP_PEAKOUTRATEGN=gn口sgsn上行字节峰值速率 --GTP_PEAKINRATEGN=gn口sgsn下行字节峰值速率 --GTP_PEAKOUTPKTGN=gn口sgsn上行包峰值速率 --GTP_PEAKINPKTGN=gn口sgsn下行包峰值速率 --GBNS_INOCT=gb口上行流量 --GBNS_OUTOCT=gb口下行流量 --GBNS_PEAKINRATE=gb口上行峰值速率 --GBNS_PEAKOUTRATE=gb口下行峰值速率 --GBNS_INOCT_NSEI=分nse的gb口上行流量 --GBNS_OUTOCT_NSEI=分nse的gb口下行流量 --GBNS_PEAKINRATE_NSEI=分nse的gb口上行峰值速率 --GBNS_PEAKOUTRATE_NSEI=分nse的gb口下行峰值速率 --IUPS_INOCT=iups口上行流量 --IUPS_OUTOCT=iups口下行流量 --IUPS_PEAKINRATE=iups口上行峰值速率 --IUPS_PEAKOUTRATE=iups口下行峰值速率 --DNS_ATTDNSQUERY=dns解析尝试次数 --DNS_SUCCDNSRESP=dns解析成功次数
</select>

select　
TO_CHAR(BEGINTIME,'yyyy-mm-dd HH24:mi:ss') BEGINTIME,
TO_CHAR(ENDTIME,'yyyy-mm-dd HH24:mi:ss') ENDTIME,
INFOMODELREFERENCED,
DNPREFIX,
SENDERNAME,
VENDORNAME,
JOBID,
OBJECTTYPE,
PM_DN,
PM_USERLABEL,
SM_ATTACTPDPCONTEXT,
SM_SUCCACTPDPCONTEXT,
SM_FAILACTPDPCTXTMSUSERCAUSE,
SM_FAILACTPDPCTXTMSUSERCAUSE27,
SM_FAILACTPDPCTXTMSUSERCAUSE28,
SM_FAILACTPDPCTXTMSUSERCAUSE29,
SM_FAILACTPDPCTXTMSUSERCAUSE32,
SM_FAILACTPDPCTXTMSUSERCAUSE33,
SM_ATTACTPDPCONTEXTSTATIC,
SM_SUCCACTPDPCONTEXTSTATIC,
SM_MEANACTPDPCONTEXT,
SM_MEANACTPDPCONTEXTWITHDT,
SM_MAXACTPDPCONTEXT,
SM_ATTDEACTPDPCONTEXTSGSN,
SM_SUCCDEACTPDPCONTEXTSGSN,
SM_ATTDEACTPDPCONTEXTMS,
SM_SUCCDEACTPDPCONTEXTMS,
SM_ATTDEACTPDPCONTEXTGGSN,
SM_SUCCDEACTPDPCONTEXTGGSN,
SM_ATTACTSECONDPDPCONTEXT,
SM_SUCCACTSECONDPDPCONTEXT,
SM_ATTMODPDPCONTEXTMS,
SM_SUCCMODPDPCONTEXTMS,
SM_ATTMODPDPCONTEXTSGSN,
SM_SUCCMODPDPCONTEXTSGSN,
SM_ATTUPDPDPCONTEXTGGSN,
SM_SUCCUPDPDPCONTEXTGGSN,
SM_ATTUPDPDPCONTEXTSGSN,
SM_SUCCUPDPDPCONTEXTSGSN,
SM_ATTACTPDPCONTEXT_RAI,
SM_SUCCACTPDPCONTEXT_RAI,
SM_MEANACTPDPCONTEXT_RAI,
SM_MAXACTPDPCONTEXT_RAI,
SM_MEANACTPDPCONTEXT_NSEI,
SM_MEANACTPDPCONTEXT_RNCID,
MAP_ATTSENDAUTHINFOHLR,
MAP_SUCCSENDAUTHINFOHLR,
MM_ATTGPRSATTACH,
MM_SUCCGPRSATTACH,
MM_FAILEDGPRSATTACHUSER,
MM_FAILEDGPRSATTACHUSER_3,
MM_FAILEDGPRSATTACHUSER_6,
MM_FAILEDGPRSATTACHUSER_7,
MM_FAILEDGPRSATTACHUSER_8,
MM_FAILEDGPRSATTACHUSER_14,
MM_ATTGPRSDETACHMS,
MM_ATTGPRSDETACHSGSN,
MM_SUCCGPRSDETACHSGSN,
MM_ATTGPRSDETACHHLR,
MM_MEANNBRATTACHEDSUB,
MM_MEANNBRATTACHEDSUBSIM,
MM_MEANNBRATTACHEDSUBUSIM,
MM_MAXNBRATTACHEDSUB,
MM_ATTINTRASGSNRAU,
MM_SUCCINTRASGSNRAU,
MM_FAILINTRASGSNRAU,
MM_ATTINTRASGSNPERIODICRAU,
MM_SUCCINTRASGSNPERIODICRAU,
MM_ATTINTERSGSNRAU,
MM_SUCCINTERSGSNRAU,
MM_FAILINTERSGSNRAU,
MM_FAILINTERSGSNRAU_12,
MM_FAILINTERSGSNRAU_14,
MM_FAILINTERSGSNRAU_15,
MM_ATTPSPAGINGPROCGB,
MM_SUCCPSPAGINGPROCGB,
MM_ATTPSPAGINGPROCIU,
MM_SUCCPSPAGINGPROCIU,
MM_ATTGPRSATTACH_RAI,
MM_SUCCGPRSATTACH_RAI,
MM_ATTGPRSDETACHMS_RAI,
MM_ATTGPRSDETACHSGSN_RAI,
MM_SUCCGPRSDETACHSGSN_RAI,
MM_MEANNBRATTACHEDSUB_RAI,
MM_MEANNBRATTACHEDSUBSIM_RAI,
MM_MEANNBRATTACHEDSUBUSIM_RAI,
MM_MAXNBRATTACHEDSUB_RAI,
MM_ATTINTRASGSNRAU_RAI,
MM_SUCCINTRASGSNRAU_RAI,
MM_ATTINTRASGSNPERIODICRAU_RAI,
MM_SUCCINTRASGSNPERIODICRAURAI,
MM_ATTINTERSGSNRAU_RAI,
MM_SUCCINTERSGSNRAU_RAI,
MM_ATTPSPAGINGPROCGB_RAI,
MM_SUCCPSPAGINGPROCGB_RAI,
MM_ATTPSPAGINGPROCIU_RAI,
MM_SUCCPSPAGINGPROCIU_RAI,
MM_MEANNBRATTACHEDSUB_NSEI,
MM_MEANNBRATTACHEDSUB_RNCID,
MM_FAILINTERSGSNRAU_CAUSE,
MM_FAILINTRASGSNRAU_CAUSE,
RELOC_ATTINTERSGSN,
RELOC_SUCCINTERSGSN,
RELOC_ATTINTRASGSN,
RELOC_SUCCINTRASGSN,
RELOC_ATTCOMBIINTERSGSN,
RELOC_SUCCCOMBIINTERSGSN,
RELOC_ATTCOMBIINTRASGSN,
RELOC_SUCCCOMBIINTRASGSN,
ISYSC_ATTINTRASGSNGSMUMTSRAU,
ISYSC_SUCCINTRASGSNGSMUMTSRAU,
ISYSC_ATTINTRASGSNUMTSGSMRAU,
ISYSC_SUCCINTRASGSNUMTSGSMRAU,
SEC_ATTAUTHPROCSSGSN,
SEC_SUCCAUTHPROCSSGSN,
SEC_ATTIDENTITYREQUEST,
SEC_SUCCIDENTITYREQUEST,
SEC_ATTSECMODE,
SEC_SUCCSECMODE,
GTPP_CDRTRANSFREQ,
GTPP_CDRTRANSFREQ_1,
GTPP_CDRTRANSFREQ_2,
GTPP_SUCCCDRTRANSF,
GTP_INPKTGN,
GTP_OUTPKTGN,
GTP_INOCTGN,
GTP_OUTOCTGN,
GTP_DISCPKTGN,
GTP_PEAKOUTRATEGN,
GTP_PEAKINRATEGN,
GTP_PEAKOUTPKTGN,
GTP_PEAKINPKTGN,
GBNS_INOCT,
GBNS_OUTOCT,
GBNS_PEAKINRATE,
GBNS_PEAKOUTRATE,
GBNS_INOCT_NSEI,
GBNS_OUTOCT_NSEI,
GBNS_PEAKINRATE_NSEI,
GBNS_PEAKOUTRATE_NSEI,
IUPS_INOCT,
IUPS_OUTOCT,
IUPS_PEAKINRATE,
IUPS_PEAKOUTRATE,
DNS_ATTDNSQUERY,
DNS_SUCCDNSRESP
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and BEGINTIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//彩信成功率定制报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_MMS_EXT_SH_SUCCRATE_D</if>   
</select>


<select id="resultMapping">
 --LSTUP_TIME=开始时间 --SDATE=日期 --SCOLUMNNAME=业务名称 --SKIND=彩信中心 --SCOLUMNVALUE=点到点下发数 --DORDER=提交总数 --SERVICE_IP=服务地址
</select>

select 
to_char(LSTUP_TIME, 'yyyy-mm-dd HH24:mi:ss') LSTUP_TIME,
SDATE,
SCOLUMNNAME,
SKIND,
SCOLUMNVALUE,
DORDER,
SERVICE_IP
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(LSTUP_TIME,'yyyymmdd') || '0000' in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-char"/>

//重要SP成功率定制报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_MMS_EXT_SH_SPRATE_D</if>   
</select>


<select id="resultMapping">
 --LSTUP_TIME=开始时间 --SDATE=日期 --ISPTYPE=类型 --SREMARK=业务标志 --SSPCODE=业务编码 --SSPDESC=生活播报 --IAOCOUNT=下发总数 --IMTRECVRATE=成功率 --SERVICE_IP=服务地址 --
</select>

select 
to_char(LSTUP_TIME, 'yyyy-mm-dd HH24:mi:ss') LSTUP_TIME,
SDATE,
ISPTYPE,
SREMARK,
SSPCODE,
SSPDESC,
IAOCOUNT，
IMTRECVRATE,
SERVICE_IP
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(LSTUP_TIME,'yyyymmdd') || '0000' in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-char"/>

//短信中心至EMSE报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_SMS_SMSC_ESME_D</if>   
</select>


<select id="resultMapping">
 --V_SCAN_START_TIME=开始时间 --V_SCAN_STOP_TIME=结束时间 --SMSCCODE=短信中心号码 --ACCNO=编号 --SYSTEMID=短信中心名称 --AOCNT=短信中心接到EMS发过来的的短信总条数 --AOSUCCCNT=短信中心接到EMS发过来的的短信成功条数 --AORATIO=短信中心接到EMS发过来的的短信成功率(%) --ATCNT=短信中心发往EMS的短信总条数 --ATSUCCCNT=短信中心发往EMS的短信成功条数 --ATRATIO=短信中心发往EMS的短信成功率(%)
</select>

select 
to_char(V_SCAN_START_TIME,'yyyy-mm-dd') V_SCAN_START_TIME,
to_char(V_SCAN_STOP_TIME,'yyyy-mm-dd') V_SCAN_STOP_TIME,
SMSCCODE,
ACCNO,
SYSTEMID,
AOCNT,
AOSUCCCNT,
AORATIO,
ATCNT,
ATSUCCCNT,
ATRATIO
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and V_SCAN_START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//国际短信流量统计
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_SMS_ISMG_DGW_T_FW_N_D</if>   
</select>


<select id="resultMapping">
 --START_TIME=开始时间 --END_TIME=结束时间 --GW_NAME=网关名称 --MT_FWD_NUM=接收MT前转总数 --MT_FWD_SUC_NUM=接收MT成功数 --MT_FWD_FAIL_NUM=接收MT失败数 --MT_FWD_SUC_RATIO=接收MT成功率(%) --MO_FWD_NUM=接收M0前转总数 --MO_FWD_SUC_NUM=接收MO成功数 --MO_FWD_FAIL_NUM=接收MO失败数 --MO_FWD_SUC_RATIO=接收MO成功率(%) --RCV_MT_FWD_NUM=发送MT前转总数 --RCV_MT_FWD_SUC_NUM=发送MT成功数 --RCV_MT_FWD_FAIL_NUM=发送MT失败数 --RCV_MT_FWD_SUC_RATIO=发送MT成功率(%) --RCV_MO_FWD_NUM=发送MO前转总数 --RCV_MO_FWD_SUC_NUM=发送MO成功数 --RCV_MO_FWD_FAIL_NUM=发送MO失败数 --RCV_MO_FWD_SUC_RATIO=发送MO成功率(%)
</select>

select 
to_char(START_TIME,'yyyy-mm-dd') START_TIME,
to_char(END_TIME,'yyyy-mm-dd') END_TIME,
GW_NAME,
MT_FWD_NUM,
MT_FWD_SUC_NUM,
MT_FWD_FAIL_NUM,
MT_FWD_SUC_RATIO,
MO_FWD_NUM,
MO_FWD_SUC_NUM,
MO_FWD_FAIL_NUM,
MO_FWD_SUC_RATIO,
RCV_MT_FWD_NUM,
RCV_MT_FWD_SUC_NUM,
RCV_MT_FWD_FAIL_NUM,
RCV_MT_FWD_SUC_RATIO,
RCV_MO_FWD_NUM,
RCV_MO_FWD_SUC_NUM,
RCV_MO_FWD_FAIL_NUM,
RCV_MO_FWD_SUC_RATIO
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//短信日汇总报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_SMS_ISMG_COLLECT_D</if>   
</select>


<select id="resultMapping">
 --TIME_STAMP=开始时间 --EMSME_AOCNT=忙时AO发送数 --EMSME_ATCNT=忙时AT发送数 --RCV_MO_FWD_NUM=接收MO前转总数 --RECV_MSG_NUM=接收到的短消息数 --MO_ATCNT=梦网MO --AO_AOCNT=梦网AO --B_MO_ATCNT=梦网MO(17-18点) --B_AO_AOCNT=梦网AO(17-18点) --ATRATIO=MO接通率(%) --AORATIO=AO接通率(%) --DX_SEND_MSG_OK_RATIO=电信至梦网短信成功率(%) --LT_SEND_MSG_OK_RATIO=联通至梦网短信成功率(%) --DX_STATUS_SUCC_RATIO=电信成功率(%) --SEND_SHORT_MSG_NUM=移动发送至电信短信总数(21-22点) --B_SEND_SHORT_MSG_NUM=移动全天发送至电信短信总数 --DX_RECV_SHORT_MSG_NUM=电信接收短信总数(21-22点) --DX_B_RECV_SHORT_MSG_NUM=电信接收短信全天总数 --LT_SEND_SHORT_MSG_NUM=移动发送至联通短信总数(21-22点) --LT_B_SEND_SHORT_MSG_NUM=移动全天发送至联通短信总数 --LT_RECV_SHORT_MSG_NUM=联通接收短信总数(21-22点) --LT_B_RECV_SHORT_MSG_NUM=联通接收短信全天总数
</select>

select 
to_char(TIME_STAMP,'yyyy-mm-dd') TIME_STAMP,
EMSME_AOCNT,
EMSME_ATCNT,
RCV_MO_FWD_NUM,
RECV_MSG_NUM,
MO_ATCNT,
AO_AOCNT,
B_MO_ATCNT,
B_AO_AOCNT,
ATRATIO,
AORATIO,
DX_SEND_MSG_OK_RATIO,
LT_SEND_MSG_OK_RATIO,
DX_STATUS_SUCC_RATIO,
SEND_SHORT_MSG_NUM,
B_SEND_SHORT_MSG_NUM,
DX_RECV_SHORT_MSG_NUM,
DX_B_RECV_SHORT_MSG_NUM,
LT_SEND_SHORT_MSG_NUM,
LT_B_SEND_SHORT_MSG_NUM,
LT_RECV_SHORT_MSG_NUM,
LT_B_RECV_SHORT_MSG_NUM

from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_STAMP in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//行业网关接收量、发送量报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_SMS_SMSC_ESME_D</if>   
</select>


<select id="resultMapping">
 --V_SCAN_START_TIME=开始时间 --V_SCAN_STOP_TIME=结束时间 --SMSCCODE=短信中心号码 --ACCNO=编号 --SYSTEMID=短信中心名称 --AOCNT=短信中心接到EMS发过来的的短信总条数 --AOSUCCCNT=短信中心接到EMS发过来的的短信成功条数 --AORATIO=短信中心接到EMS发过来的的短信成功率(%) --ATCNT=短信中心发往EMS的短信总条数 --ATSUCCCNT=短信中心发往EMS的短信成功条数 --ATRATIO=短信中心发往EMS的短信成功率(%)
</select>

select 
to_char(V_SCAN_START_TIME,'yyyy-mm-dd') V_SCAN_START_TIME,
to_char(V_SCAN_STOP_TIME,'yyyy-mm-dd') V_SCAN_STOP_TIME,
SMSCCODE,
ACCNO,
SYSTEMID,
AOCNT,
AOSUCCCNT,
AORATIO,
ATCNT,
ATSUCCCNT,
ATRATIO
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and V_SCAN_START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//RADIUS认证报表_汇总
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_RADIUS_WLAN_ACCESS_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_SMS_SMSC_ESME_D</if>   
</select>


<select id="resultMapping">
 --USER_TIME=开始时间 --ACNAME=AC名称 --SSIDNAME=SSID名称 --AUTH_SUCC_NUM=认证成功数 --AUTH_FAIL_NUM=认证失败数 --PWD_ERRO_NUM=密码错误次数 --NO_RESPONSE_NUM=非法账号次数 --NO_LM_NUM=唯一性限制 --WLAN_IS_LOCKED_NUM=WLAN使用已锁定账户登录 --RS_NUM=反算失败次数 --WLAN_CALL_TO_ID_NUM=网络原因(SSID不存在)次数 --BROAD_AI_VLAN_ID_NUM=其他原因 --BROAD_TIME_OUT_NUM=网络超时 --FALL_BY_NETWORK=网络原因导致失败数 --PWD_IS_NULL=密码为空 --USER_IS_NULL=用户名为空
</select>

select 
to_char(USER_TIME,'yyyy-mm-dd hh24:mi:ss') USER_TIME,
ACNAME,
SSIDNAME,
AUTH_SUCC_NUM,
AUTH_FAIL_NUM,
PWD_ERRO_NUM,
NO_RESPONSE_NUM,
NO_LM_NUM,
WLAN_IS_LOCKED_NUM,
RS_NUM,
WLAN_CALL_TO_ID_NUM,
BROAD_AI_VLAN_ID_NUM,
BROAD_TIME_OUT_NUM,
FALL_BY_NETWORK,
PWD_IS_NULL,
USER_IS_NULL
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and USER_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>


//重要SP成功率定制报表_正确
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_BRAS_VPDN_USER_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_CPU_MEM_KPI_H</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_MMS_EXT_SH_SPRATE_D</if>   
</select>


<select id="resultMapping">
 --STARTTIME=日期 --SERVICE_IP=彩信中心 --SSPCODE=手机冲浪 --SREMARK=手机阅读 --SSPDESC=彩信账单 --IAOCOUNT=手机商界 --IMTRECVRATE=生活播报
</select>

select 
to_char(STARTTIME, 'yyyy-mm-dd') STARTTIME,
SERVICE_IP,
SSPCODE,
SREMARK,
SSPDESC
IAOCOUNT,
IMTRECVRATE
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and STARTTIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>