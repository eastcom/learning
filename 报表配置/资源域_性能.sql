//资源域_性能_话务网管_短信中心_H表_小时
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_F_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --
</select>

//短消息业务中心配置信息
<select id="tableChooseSE">
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_PZ_D</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --DN=网元DN --NE_NAME=网元别名 --TIME_STAMP=时间 --NE_ZH_LABEL=设备名称 --INT_ID=网元标识 --SMC_ID=短信中心ID --SMSC_NAME=短信中心名称 --VENDOR_NAME=短信中心设备制造商 --STORE_CAPABILITY=短消息中心转发短消息的最大存储条数 --PROCESS_CAPABILITY=短信中心设计每秒处理条数(短信中心容量)
</select>

SELECT 
to_char(TIME_STAMP,'yyyy-MM-dd') TIME_STAMP,
SYSTEM_TITLE,
NE_CLASS,
DN,
NE_NAME,
NE_ZH_LABEL,
INT_ID,
SMC_ID,
SMSC_NAME,
VENDOR_NAME,
STORE_CAPABILITY,
PROCESS_CAPABILITY
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(TIME_STAMP,'yyyyMMdd') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,8)
</jdbcType>

//短信中心业务分类性能统计 
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_YWFL_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --CITY_ID=所属城市 --PPS_REFMO_NUM=PPS手机向短信中心提交的短信条数(MO)  --CENETER_DISTRMT_NUM=短信中心向PPS手机下发成功的短信条数(MT)  --SERVICE_REFAO_NUM=移动梦网业务提交条数（AO，PUSH） --SERVICE_REFMO_NUM=移动梦网业务提交条数（MO，PULL） --SERVICE_SENDMT_TOTAL=移动梦网业务下发成功总条数（MT） --CHAT_TYPE_REFAO_NUM=聊天类（包含QQ和其它SP提供的聊天业务）提交条数（AO，PUSH） --CHAT_TYPE_REFMO_NUM=聊天类（包含QQ和其它SP提供的聊天业务）提交条数（MO，PULL） --CHAT_TYPE_DISTRMT_NUM=聊天类（包含QQ和其它SP提供的聊天业务）下发成功条数（MT） --SER1258_REF_AO=秘书台1258业务提交条数（AO） --SER1258_SEND_SUCMT=秘书台1258业务发送成功条数（MT） --SER1259_REF_AO=自由呼业务（1259）提交条数（AO） --SER1259_SEND_SUCMT_NUM=自由呼业务（1259）发送成功条数（MT） --INFO_ORDER_REF_AO=信息点播业务提交条数（MO） --INFO_ORDER_REBOUND_NUM=信息点播返回短信条数（MT） --INFO_ORDER_REBOUND_SUC=信息点播返回成功的短信条数（MT） --FIN_SER_REF_NUM=手机银行业、证券业务提交条数（MO） --FIN_SER_REBOUND_NUM=手机银行业务、证券业务返回成功条数（MT） --RADIATE_REF_AO=广播业务提交条数（AO） --RADIATE_SENDMT_NUM=广播业务发送成功条数（MT） --ROAM_MES_SEND=漫游欢迎短信发送条数 --ROAM_MES_SEND_SUC=漫游欢迎短信发送成功条数 --PPS_REMIND_SEND=PPS用户充值和余额不足提醒短信发送条数 --PPS_REMIND_SEND_SUC=PPS用户充值和余额不足提醒短信发送成功条数 --GLOBE_REMIND_SEND=全球通话费催交和充值提醒短信发送条数 --GLOBE_REMIND_SEND_SUC=全球通话费催交和充值提醒短信发送成功条数 --BROADCAST_MSG=免费广播信息
</select>

SELECT
to_char(START_TIME,'yyyy-MM-dd HH24') START_TIME,
to_char(STOP_TIME,'yyyy-MM-dd HH24') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
NE_NAME,
INT_ID,
CITY_ID,
PPS_REFMO_NUM,
CENETER_DISTRMT_NUM,
SERVICE_REFAO_NUM,
SERVICE_REFMO_NUM,
SERVICE_SENDMT_TOTAL,
CHAT_TYPE_REFAO_NUM,
CHAT_TYPE_REFMO_NUM,
CHAT_TYPE_DISTRMT_NUM,
SER1258_REF_AO,
SER1258_SEND_SUCMT,
SER1259_REF_AO,
SER1259_SEND_SUCMT_NUM,
INFO_ORDER_REF_AO,
INFO_ORDER_REBOUND_NUM,
INFO_ORDER_REBOUND_SUC,
FIN_SER_REF_NUM,
FIN_SER_REBOUND_NUM,
RADIATE_REF_AO,
RADIATE_SENDMT_NUM,
ROAM_MES_SEND,
ROAM_MES_SEND_SUC,
PPS_REMIND_SEND,
PPS_REMIND_SEND_SUC,
GLOBE_REMIND_SEND,
GLOBE_REMIND_SEND_SUC,
BROADCAST_MSG
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>

//短信中心性能参数 
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_15M</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --ACC_CENTER_CPU_LOAD=短信中心信令接入设备CPU占用率(%) --TRANSMIT_MESG_STORAGE_NUM=短信中心转发短信的存储条数 --CPU_LOAD=短信中心CPU占用率(&) --SIGNAL_LOAD=信令信道负荷(ERL)
</select>

SELECT 
to_char(START_TIME,'yyyy-MM-dd- HH24:mi') START_TIME,
to_char(STOP_TIME,'yyyy-MM-dd- HH24:mi') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
NE_NAME,
INT_ID,
round(ACC_CENTER_CPU_LOAD,2) ACC_CENTER_CPU_LOAD,
TRANSMIT_MESG_STORAGE_NUM,
round(CPU_LOAD,2) CPU_LOAD,
round(SIGNAL_LOAD,2) SIGNAL_LOAD
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24mi') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,12)
</jdbcType>

//MO网内点对点消息时延性能数据统计 
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_MO_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --MS2SMSC_MO_P2P=提交成功总数 --SUC_MS2SMSC_1_MO_P2P=首次下发即成功的消息总数 --SUC_MS2SMSC_10S_MO_P2P=下发成功时延小于10秒的数量 --SUC_MS2SMSC_20S_MO_P2PMMSUCCIN=下发成功时延大于10秒小于20秒的数量 --SUC_MS2SMSC_30S_MO_P2P=下发成功时延大于20秒小于30秒的数量 --SUC_MS2SMSC_1M_MO_P2P=下发成功时延大于30秒小于1分钟的数量 --SUC_MS2SMSC_10M_MO_P2P=下发成功时延大于1分钟小于10分钟的数量 --SUC_MS2SMSC_30M_MO_P2P=下发成功时延大于10分钟小于30分钟的数量 --SUC_MS2SMSC_1H_MO_P2P=下发成功时延大于30分钟小于1小时的数量 --SUC_MS2SMSC_12H_MO_P2P=下发成功时延大于1小时小于12小时的数量 --SUC_MS2SMSC_24H_MO_P2P=下发成功时延大于12小时小于24小时的数量 --SUC_MS2SMSC_48H_MO_P2P=下发成功时延大于24小时小于48小时的数量 --SUC_MS2SMSC_FINAL_MO_P2P=最终下发成功的数量
</select>

SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
MS2SMSC_MO_P2P,
SUC_MS2SMSC_1_MO_P2P,
SUC_MS2SMSC_10S_MO_P2P,
SUC_MS2SMSC_20S_MO_P2PMMSUCCIN,
SUC_MS2SMSC_30S_MO_P2P,
SUC_MS2SMSC_1M_MO_P2P,
SUC_MS2SMSC_10M_MO_P2P,
SUC_MS2SMSC_30M_MO_P2P,
SUC_MS2SMSC_1H_MO_P2P,
SUC_MS2SMSC_12H_MO_P2P,
SUC_MS2SMSC_24H_MO_P2P,
SUC_MS2SMSC_48H_MO_P2P,
SUC_MS2SMSC_FINAL_MO_P2P
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>

//AO消息时延性能数据统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_AO_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --ISMG2SMSC_AO_SUC=提交成功总数 --SUC_ISMG2SMSC_1_AO=首次下发即成功的消息总数 --SUC_ISMG2SMSC_10S_AO=下发成功时延小于10秒的数量 --SUC_ISMG2SMSC_20S_AO=下发成功时延大于10秒小于20秒的数量 --SUC_ISMG2SMSC_30S_AO=下发成功时延大于20秒小于30秒的数量 --SUC_ISMG2SMSC_1M_AO=下发成功时延大于30秒小于1分钟的数量 --SUC_ISMG2SMSC_10M_AO=下发成功时延大于1分钟小于10分钟的数量 --SUC_ISMG2SMSC_30M_AO=下发成功时延大于10分钟小于30分钟的数量 --SUC_ISMG2SMSC_1H_AO=下发成功时延大于30分钟小于1小时的数量 --SUC_ISMG2SMSC_12H_AO=下发成功时延大于1小时小于12小时的数量 --SUC_ISMG2SMSC_24H_AO=下发成功时延大于12小时小于24小时的数量 --SUC_ISMG2SMSC_48H_AO=下发成功时延大于24小时小于48小时的数量 --SUC_ISMG2SMSC_FINAL_AO=最终下发成功的数量
</select>

SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
ISMG2SMSC_AO_SUC,
SUC_ISMG2SMSC_1_AO,
SUC_ISMG2SMSC_10S_AO,
SUC_ISMG2SMSC_20S_AO,
SUC_ISMG2SMSC_30S_AO,
SUC_ISMG2SMSC_1M_AO,
SUC_ISMG2SMSC_10M_AO,
SUC_ISMG2SMSC_30M_AO,
SUC_ISMG2SMSC_1H_AO,
SUC_ISMG2SMSC_12H_AO,
SUC_ISMG2SMSC_24H_AO,
SUC_ISMG2SMSC_48H_AO,
SUC_ISMG2SMSC_FINAL_AO
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>

//短信中心F表性能数据
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_F_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --ISMG2SMSC_IP_SUC=提交成功总数(IP-SM-GW) --ISMG2SMSC_RCS_SUC=提交成功总数(RCS) --SUC_ISMG2SMSC_1_IP=IP-SM-GW首次下发即成功的消息总数 --SUC_ISMG2SMSC_1_RCS=RCS首次下发即成功的消息总数 --SUC_ISMG2SMSC_10S_IP=IP-SM-GW下发成功时延小于10秒的数量 --SUC_ISMG2SMSC_10S_RCS=RCS下发成功时延小于10秒的数量 --SUC_ISMG2SMSC_20S_IP=IP-SM-GW下发成功时延大于10秒小于20秒的数量 --SUC_ISMG2SMSC_20S_RCS=RCS下发成功时延大于10秒小于20秒的数量 --SUC_ISMG2SMSC_30S_IP=IP-SM-GW下发成功时延大于20秒小于30秒的数量 --SUC_ISMG2SMSC_30S_RCS=RCS下发成功时延大于20秒小于30秒的数量 --SUC_ISMG2SMSC_1M_IP=IP-SM-GW下发成功时延大于30秒小于1分钟的数量 --SUC_ISMG2SMSC_1M_RCS=RCS下发成功时延大于30秒小于1分钟的数量 --SUC_ISMG2SMSC_10M_IP=IP-SM-GW下发成功时延大于1分钟小于10分钟的数量 --SUC_ISMG2SMSC_10M_RCS=RCS下发成功时延大于1分钟小于10分钟的数量 --SUC_ISMG2SMSC_30M_IP=IP-SM-GW下发成功时延大于10分钟小于30分钟的数量 --SUC_ISMG2SMSC_30M_RCS=RCS下发成功时延大于10分钟小于30分钟的数量 --SUC_ISMG2SMSC_1H_IP=IP-SM-GW下发成功时延大于30分钟小于1小时的数量 --SUC_ISMG2SMSC_1H_RCS=RCS下发成功时延大于30分钟小于1小时的数量 --SUC_ISMG2SMSC_12H_IP=IP-SM-GW下发成功时延大于1小时小于12小时的数量 --SUC_ISMG2SMSC_12H_RCS=RCS下发成功时延大于1小时小于12小时的数量 --SUC_ISMG2SMSC_24H_IP=IP-SM-GW下发成功时延大于12小时小于24小时的数量 --SUC_ISMG2SMSC_24H_RCS=RCS下发成功时延大于12小时小于24小时的数量 --SUC_ISMG2SMSC_48H_IP=IP-SM-GW下发成功时延大于24小时小于48小时的数量 --SUC_ISMG2SMSC_48H_RCS=RCS下发成功时延大于24小时小于48小时的数量 --SUC_ISMG2SMSC_FINAL_IP=IP-SM-GW最终下发成功的数量 --SUC_ISMG2SMSC_FINAL_RCS=RCS最终下发成功的数量
</select>
SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24:mi') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
ISMG2SMSC_IP_SUC,
ISMG2SMSC_RCS_SUC,
SUC_ISMG2SMSC_1_IP,
SUC_ISMG2SMSC_1_RCS,
SUC_ISMG2SMSC_10S_IP,
SUC_ISMG2SMSC_10S_RCS,
SUC_ISMG2SMSC_20S_IP,
SUC_ISMG2SMSC_20S_RCS,
SUC_ISMG2SMSC_30S_IP,
SUC_ISMG2SMSC_30S_RCS,
SUC_ISMG2SMSC_1M_IP,
SUC_ISMG2SMSC_1M_RCS,
SUC_ISMG2SMSC_10M_IP,
SUC_ISMG2SMSC_10M_RCS,
SUC_ISMG2SMSC_30M_IP,
SUC_ISMG2SMSC_30M_RCS,
SUC_ISMG2SMSC_1H_IP,
SUC_ISMG2SMSC_1H_RCS,
SUC_ISMG2SMSC_12H_IP,
SUC_ISMG2SMSC_12H_RCS,
SUC_ISMG2SMSC_24H_IP,
SUC_ISMG2SMSC_24H_RCS,
SUC_ISMG2SMSC_48H_IP,
SUC_ISMG2SMSC_48H_RCS,
SUC_ISMG2SMSC_FINAL_IP,
SUC_ISMG2SMSC_FINAL_RCS
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>


//短信中心H表性能数据
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_H_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --ATT_MO_P2P=用户向短信中心提交的网内点对点短信总量(条) --ATT_MO_P2P_RCS=RCS向短信中心提交的网内点对点短信总量(条) --ATT_MO_P2P_IP=IP-SM-GW向短信中心提交的网内点对点短信总量(条) --AOMNET=梦网网关向短信中心提交的下行短信总量(条) --MO_MNET=短信中心向梦网网关发送上行短信总量(条) --MO_MNET_RCS=RCS向梦网网关发送上行短信总量(条) --MO_MNET_IP=IP-SM-GW向梦网网关发送上行短信总量(条) --AOHY=行业网关向短信中心提交下行短信总量(条) --TOHY=短信中心向行业网关发送上行短信总量(条) --TOHY_RCS=RCS向行业网关发送上行短信总量(条) --TOHY_IP=IP-SM-GW向行业网关发送上行短信总量(条) --CT_TO_CMCC=与电信互通的互通网关向短信中心提交短信总量(条) --TO_CT=短信中心向与电信互通的互通网关发送短信总量(条) --TO_CT_RCS=RCS向与电信互通的互通网关发送短信总量(条) --TO_CT_IP=IP-SM-GW向与电信互通的互通网关发送短信总量(条) --CU_TO_CMCC=与联通互通的互通网关向短信中心提交短信总量(条) --TO_CU=短信中心向与联通互通的互通网关发送短信总量(条) --TO_CU_RCS=RCS向与联通互通的互通网关发送短信总量(条) --TO_CU_IP=IP-SM-GW向与联通互通的互通网关发送短信总量(条) --FROM_MMSC=彩信中心向短信中心提交PUSH消息总量(条) --FROM_WAP=WAP网关向短信中心提交PUSH消息总量(条) --FROM_10086=直连短信中心的10086下发短信量 --TO_10086=直连短信中心的10086接收上行短信量 --FROM_OTHER=其他直连短信中心的平台提交下行短信量(条) --TO_OTHER=其他直连短信中心的平台接收上行短信量(条) --TO_OTHER_RCS=其他直连短信中心的平台接收的RCS上行短信量(条) --TO_OTHER_IP=其他直连短信中心的平台接收的IP-SM-GW上行短信量(条) --ATT_MO_RCS=RCS向短信中心提交的短信条数(MO) --ATT_MO_IP=IP-SM-GW向短信中心提交的短信条数(MO) --ATT_MO=手机向短信中心提交的短信条数(MO) --AO_TOTAL=各类应用及网关向短信中心提交的AO短信总量(条) --MSG_TO_SMSC_SUC=短信中心成功受理的短信总条数(条)
</select>
SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24:mi') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
ATT_MO_P2P,
ATT_MO_P2P_RCS,
ATT_MO_P2P_IP,
AOMNET,
MO_MNET,
MO_MNET_RCS,
MO_MNET_IP,
AOHY,
TOHY,
TOHY_RCS,
TOHY_IP,
CT_TO_CMCC,
TO_CT,
TO_CT_RCS,
TO_CT_IP,
CU_TO_CMCC,
TO_CU,
TO_CU_RCS,
TO_CU_IP,
FROM_MMSC,
FROM_WAP,
FROM_10086,
TO_10086,
FROM_OTHER,
TO_OTHER,
TO_OTHER_RCS,
TO_OTHER_IP,
ATT_MO_RCS,
ATT_MO_IP,
ATT_MO,
AO_TOTAL,
MSG_TO_SMSC_SUC
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>

//短信中心B表性能数据 -准实时
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">IPMSDW.DW_FT_RE_ST_TTNM_SMSC_B_15M</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --ATT_MO_P2P=用户向短信中心提交的网内点对点短信总量(条) --ATT_MO_P2P_RCS=RCS向短信中心提交的网内点对点短信总量(条) --ATT_MO_P2P_IP=IP-SM-GW向短信中心提交的网内点对点短信总量(条) --AOMNET=梦网网关向短信中心提交的下行短信总量(条) --MO_MNET=短信中心向梦网网关发送上行短信总量(条) --MO_MNET_RCS=RCS向梦网网关发送上行短信总量(条) --MO_MNET_IP=IP-SM-GW向梦网网关发送上行短信总量(条) --AOHY=行业网关向短信中心提交下行短信总量(条) --TOHY=短信中心向行业网关发送上行短信总量(条) --TOHY_RCS=RCS向行业网关发送上行短信总量(条) --TOHY_IP=IP-SM-GW向行业网关发送上行短信总量(条) --CT_TO_CMCC=与电信互通的互通网关向短信中心提交短信总量(条) --TO_CT=短信中心向与电信互通的互通网关发送短信总量(条) --TO_CT_RCS=RCS向与电信互通的互通网关发送短信总量(条) --TO_CT_IP=IP-SM-GW向与电信互通的互通网关发送短信总量(条) --CU_TO_CMCC=与联通互通的互通网关向短信中心提交短信总量(条) --TO_CU=短信中心向与联通互通的互通网关发送短信总量(条) --TO_CU_RCS=RCS向与联通互通的互通网关发送短信总量(条) --TO_CU_IP=IP-SM-GW向与联通互通的互通网关发送短信总量(条) --FROM_MMSC=彩信中心向短信中心提交PUSH消息总量(条) --FROM_WAP=WAP网关向短信中心提交PUSH消息总量(条) --FROM_10086=直连短信中心的10086下发短信量 --TO_10086=直连短信中心的10086接收上行短信量 --FROM_OTHER=其他直连短信中心的平台提交下行短信量(条) --TO_OTHER=其他直连短信中心的平台接收上行短信量(条) --TO_OTHER_RCS=其他直连短信中心的平台接收的RCS上行短信量(条) --TO_OTHER_IP=其他直连短信中心的平台接收的IP-SM-GW上行短信量(条) --ATT_MO_RCS=RCS向短信中心提交的短信条数(MO) --ATT_MO_IP=IP-SM-GW向短信中心提交的短信条数(MO) --ATT_MO=手机向短信中心提交的短信条数(MO) --AO_TOTAL=各类应用及网关向短信中心提交的AO短信总量(条) --MSG_TO_SMSC_SUC=短信中心成功受理的短信总条数(条) --SUC_PROCESSED_MO_IP=IP-SM-GW向短信中心提交成功的短信条数(MO) --SUC_PROCESSED_MO_RCS=RCS向短信中心提交成功的短信条数(MO) --ATT_MT=短信中心下发给手机的短信条数(MT含重发) --ATT_MT_NRETRY=短信中心下发给手机的短信条数(MT不含重发) --SUC_MT=短信中心成功下发给手机的短信条数(MT) --SUC_MT_P2P=短信中心下发成功的点对点短信总条数(MT) --UNSUC_MT_USR_RSN=由于用户原因导致下发失败的短消息次数(MT,下发手机) --UNSUC_MT_NET_RSN=由于网络原因导致下发失败的短消息条数(MT,下发手机)
</select>

SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24:mi') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
MSG_TO_SMSC_SUC,
ATT_MO_IP,
ATT_MO_RCS,
SUC_PROCESSED_MO_IP,
SUC_PROCESSED_MO_RCS,
ATT_MT,
ATT_MT_NRETRY,
SUC_MT,
ATT_MO_P2P_IP,
ATT_MO_P2P_RCS,
SUC_MT_P2P,
UNSUC_MT_USR_RSN,
UNSUC_MT_NET_RSN
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24mi') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,12)
</jdbcType>

//省际漫入用户数
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_ROAM_UNUM_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --ORG_SYSTEM_TITLE=源省份ID --ROAM_SUB=漫入用户数 --NETWORK_TYPE=网络类型
</select>
SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24:mi') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
ORG_SYSTEM_TITLE,
ROAM_SUB,
NETWORK_TYPE
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>

//VLR性能数据
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_TTNM_VLR_H</if>
</select>

<select id="resultMapping">
    --SYSTEM_TITLE=省网标识 --NE_CLASS=网元类型 --INT_ID=网元标识 --NE_NAME=网元别名 --START_TIME=开始时间 --STOP_TIME=结束时间 --SUBSCRIB_IN_VLR=VLR用户总数 --ACTIVE_SUBS=VLR开机用户总数
</select>
SELECT
TO_CHAR(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,
TO_CHAR(STOP_TIME,'yyyy-MM-dd hh24:mi') STOP_TIME,
SYSTEM_TITLE,
NE_CLASS,
INT_ID,
SUBSCRIB_IN_VLR,
ACTIVE_SUBS
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(START_TIME,'yyyyMMddHH24') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,10)
</jdbcType>