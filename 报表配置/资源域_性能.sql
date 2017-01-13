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

//资源域_性能_行业网关_基于帐号的端到端业务统计
<jdbcType name="discteteTime" type="array-date"/>
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_E2E_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_E2E_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_E2E_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_E2E_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --NODE_ID=统计节点 --UP_ITEM_CODE=上级网元设备代码 --DOWN_ITEM_CODE=下级网元设备代码 --UP_MSG_TOTAL_SUM=从上级网元收到的消息总数 --UP_MSG_SUCC_SUM=从上级网元收到的成功消息总数 --TO_DOWN_MSG_TOTAL_SUM=转发到下级网元的消息总数 --TO_DOWN_MSG_SUCC_SUM=转发到下级网元的成功消息总数 --TO_DOWN_MSG_FAIL_SUM=转发到下级网元失败数(不含超时) --RECV_DOWN_RPT_TOTAL_SUM=接收到下级网元回执数 --RECV_DOWN_RPT_SUCC_SUM=接收到下级网元成功回执数 --TO_ORIGN_RPT_SUCC_SUM=转发回执到源网元数 --TO_ORIGN_RPT_FAIL_SUM=转发成功回执到源网元数
</select>

SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  NODE_ID,
  UP_ITEM_CODE,
  DOWN_ITEM_CODE,
  UP_MSG_TOTAL_SUM,
  UP_MSG_SUCC_SUM,
  TO_DOWN_MSG_TOTAL_SUM,
  TO_DOWN_MSG_SUCC_SUM,
  TO_DOWN_MSG_FAIL_SUM,
  RECV_DOWN_RPT_TOTAL_SUM,
  RECV_DOWN_RPT_SUCC_SUM,
  TO_ORIGN_RPT_SUCC_SUM,
  TO_ORIGN_RPT_FAIL_SUM
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and to_char(start_time,'yyyyiw')||'000000' between #startTime# and #endTime#
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyymm') and to_date(substr(#endTime#,0,6),'yyyymm')
  </if3>

</if>





//EC/SI到本省SMSC及外省网关的MT、MO业务量统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_MTMO_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_MTMO_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_MTMO_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_MTMO_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --EC_ID=ec/si企业代码 --EC_SERVICE_CODE=ec/si服务代码 --ECTOGW_MT_TOTAL_CNT=ec/si向网关提交mt总量 --GWTOEC_MO_TOTAL_CNT=网关向ec/si发送mo总量 --ECTOSC_SEND_TOTAL_CNT=ec向本省网关提交mt-发送总量 --ECTOSC_SEND_SUCC_CNT=ec向本省网关提交mt-发送成功量 --ECTOSC_RECV_RPT_TOTAL_CNT=ec向本省网关提交mt-状态报告总量 --ECTOSC_RECV_RPT_SUCC_CNT=ec向本省网关提交mt-成功状态报告量 --SCTOEC_SEND_TOTAL_CNT=本省网关向ec发送mo-发送总量 --SCTOEC_SEND_SUCC_CNT=本省网关向ec发送mo-发送成功量 --GW_SMSC_RPT_TOTAL_CNT=本省网关向ec发送mo-状态报告总量 --GW_SMSC_RPT_SUCC_CNT=本省网关向ec发送mo-成功状态报告量 --ECTOGW_SEND_TOTAL_CNT=ec向异省网关前转mt-前转总量 --ECTOGW_SEND_SUCC_CNT=ec向异省网关前转mt-前转成功量 --ECTOGW_RECV_RPT_TOTAL_CNT=ec向异省网关前转mt-状态报告总量 --ECTOGW_RECV_RPT_SUCC_CNT=ec向异省网关前转mt-成功状态报告量 --GWTOEC_SEND_TOTAL_CNT=异省网关向ec前转mo-前转总量 --GWTOEC_SEND_SUCC_CNT=异省网关向ec前转mo-前转成功量 --GW_GW_RPT_TOTAL_CNT=异省网关向ec前转mo-状态报告总量 --GW_GW_RPT_SUCC_CNT=异省网关向ec前转mo-成功状态报告量
</select>
SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  EC_ID,
  EC_SERVICE_CODE,
  ECTOGW_MT_TOTAL_CNT,
  GWTOEC_MO_TOTAL_CNT,
  ECTOSC_SEND_TOTAL_CNT,
  ECTOSC_SEND_SUCC_CNT,
  ECTOSC_RECV_RPT_TOTAL_CNT,
  ECTOSC_RECV_RPT_SUCC_CNT,
  SCTOEC_SEND_TOTAL_CNT,
  SCTOEC_SEND_SUCC_CNT,
  GW_SMSC_RPT_TOTAL_CNT,
  GW_SMSC_RPT_SUCC_CNT,
  ECTOGW_SEND_TOTAL_CNT,
  ECTOGW_SEND_SUCC_CNT,
  ECTOGW_RECV_RPT_TOTAL_CNT,
  ECTOGW_RECV_RPT_SUCC_CNT,
  GWTOEC_SEND_TOTAL_CNT,
  GWTOEC_SEND_SUCC_CNT,
  GW_GW_RPT_TOTAL_CNT,
  GW_GW_RPT_SUCC_CNT
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyydd') and to_date(substr(#endTime#,0,6),'yyyydd')
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyydd') and to_date(substr(#endTime#,0,6),'yyyydd')
  </if3>

</if>

//全网EC/SI与异省网关间业务量统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_OGW_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_OGW_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_OGW_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_ECSI_OGW_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --EC_ID=EC/SI企业代码 --NODE_ID=节点号 --OTHER_GW_NAME=异省网关名称 --OTHER_GW_CODE=异省网关设备编号 --EC_SERVICE_CODE=ec/si服务代码 --ECTOGW_MT_TOTAL_CNT=ec/si向网关提交mt总量 --GWTOEC_MO_TOTAL_CNT=网关向ec/si发送mo总量 --ECTOSC_SEND_TOTAL_CNT=ec向本省网关提交mt-发送总量 --ECTOSC_SEND_SUCC_CNT=ec向本省网关提交mt-发送成功量 --ECTOSC_RECV_RPT_TOTAL_CNT=ec向本省网关提交mt-状态报告总量 --ECTOSC_RECV_RPT_SUCC_CNT=ec向本省网关提交mt-成功状态报告量 --SCTOEC_SEND_TOTAL_CNT=本省网关向ec发送mo-发送总量 --SCTOEC_SEND_SUCC_CNT=本省网关向ec发送mo-发送成功量 --GW_SMSC_RPT_TOTAL_CNT=本省网关向ec发送mo-状态报告总量 --GW_SMSC_RPT_SUCC_CNT=本省网关向ec发送mo-成功状态报告量 --ECTOGW_SEND_TOTAL_CNT=ec向异省网关前转mt-前转总量 --ECTOGW_SEND_SUCC_CNT=ec向异省网关前转mt-前转成功量 --ECTOGW_RECV_RPT_TOTAL_CNT=ec向异省网关前转mt-状态报告总量 --ECTOGW_RECV_RPT_SUCC_CNT=ec向异省网关前转mt-成功状态报告量 --GWTOEC_SEND_TOTAL_CNT=异省网关向ec前转mo-前转总量 --GWTOEC_SEND_SUCC_CNT=异省网关向ec前转mo-前转成功量 --GW_GW_RPT_TOTAL_CNT=异省网关向ec前转mo-状态报告总量 --GW_GW_RPT_SUCC_CNT=异省网关向ec前转mo-成功状态报告量
</select>
SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  EC_ID,
  NODE_ID,
  EC_SERVICE_CODE,
  OTHER_GW_NAME,
  OTHER_GW_CODE,  
  ECTOGW_SEND_TOTAL_CNT,
  ECTOGW_SEND_SUCC_CNT,
  ECTOGW_RECV_RPT_TOTAL_CNT,
  ECTOGW_RECV_RPT_SUCC_CNT,
  GWTOEC_SEND_TOTAL_CNT,
  GWTOEC_SEND_SUCC_CNT
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyydd') and to_date(substr(#endTime#,0,6),'yyyydd')
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyydd') and to_date(substr(#endTime#,0,6),'yyyydd')
  </if3>

</if>


//本省短信中心与异省网关间业务量统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_SMSC_OGW_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_SMSC_OGW_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_SMSC_OGW_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_SMSC_OGW_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --EC_ID=EC/SI企业代码 --NODE_ID=节点号 --SMC_NAME=短信中心名称 --SMC_CODE=短信中心设备编号 --OTHER_GW_NAME=异省网关名称 --OTHER_GW_CODE=异省网关设备编号 --SCTOGW_MO_TOTAL_CNT=前转mo总量 --SCTOGW_MO_SUCC_CNT=前转mo成功量 --SCTOGW_MO_TOTAL_RPT_CNT=前转mo状态报告总量 --SCTOGW_MO_SUCC_RPT_CNT=前转mo成功状态报告总量 --GWTOSC_MT_TOTAL_CNT --前转mt总量 --GWTOSC_MT_SUCC_CNT=前转mt成功量 --GWTOSC_MT_TOTAL_RPT_CNT=前转mt状态报告总量 --GWTOSC_MT_SUCC_RPT_CNT=前转mt成功状态报告总量
</select>
SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  NODE_ID,
  SMC_NAME,
  SMC_CODE,
  OTHER_GW_NAME,
  OTHER_GW_CODE,
  SCTOGW_MO_TOTAL_CNT,
  SCTOGW_MO_SUCC_CNT,
  SCTOGW_MO_TOTAL_RPT_CNT,
  SCTOGW_MO_SUCC_RPT_CNT,
  GWTOSC_MT_TOTAL_CNT,
  GWTOSC_MT_SUCC_CNT,
  GWTOSC_MT_TOTAL_RPT_CNT,
  GWTOSC_MT_SUCC_RPT_CNT
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and to_char(start_time,'yyyyiw')||'000000' between #startTime# and #endTime#
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyymm') and to_date(substr(#endTime#,0,6),'yyyymm')
  </if3>

</if>

//本地网关与异省网关间业务量统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_GW_OGW_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_GW_OGW_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_GW_OGW_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_GW_OGW_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --REMOTE_GW_NAME=异省网关名称 --GW_CODE=异省网关设备编号 --LFRMT_SEND_SUM=本省前转异省mt－发送总量 --LFRMT_SEND_SUCC_SUM=本省前转异省mt－发送成功量 --LFRMT_RECV_RPT_SUM=本省前转异省mt－状态报告总量 --LFRMT_RECV_RPT_SUCC_SUM=本省前转异省mt－成功状态报告量 --LFRMO_SEND_SUM=本省前转异省mo－发送总量 --LFRMO_SEND_SUCC_SUM=本省前转异省mo－发送成功量 --LFRMO_RECV_RPT_SUM=本省前转异省mo－状态报告总量 --LFRMO_RECV_RPT_SUCC_SUM=本省前转异省mo－成功状态报告量 --RFLMT_SEND_SUM=异省前转本省mt－发送总量 --RFLMT_SEND_SUCC_SUM=异省前转本省mt－发送成功量 --RFLMT_RECV_RPT_SUM=异省前转本省mt－状态报告总量 --RFLMT_RECV_RPT_SUCC_SUM=NUMBER --RFLMO_SEND_SUM=异省前转本省mo－发送总量 --RFLMO_SEND_SUCC_SUM=异省前转本省mo－发送成功量 --RFLMO_RECV_RPT_SUM=异省前转本省mo－状态报告总量 --RFLMO_RECV_RPT_SUCC_SUM=异省前转本省mo－成功状态报告量
</select>
SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  REMOTE_GW_NAME,
  GW_CODE,
  LFRMT_SEND_SUM,
  LFRMT_SEND_SUCC_SUM,
  LFRMT_RECV_RPT_SUM,
  LFRMT_RECV_RPT_SUCC_SUM,
  LFRMO_SEND_SUM,
  LFRMO_SEND_SUCC_SUM,
  LFRMO_RECV_RPT_SUM,
  LFRMO_RECV_RPT_SUCC_SUM,
  RFLMT_SEND_SUM,
  RFLMT_SEND_SUCC_SUM,
  RFLMT_RECV_RPT_SUM,
  RFLMT_RECV_RPT_SUCC_SUM,
  RFLMO_SEND_SUM,
  RFLMO_SEND_SUCC_SUM,
  RFLMO_RECV_RPT_SUM,
  RFLMO_RECV_RPT_SUCC_SUM
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and to_char(start_time,'yyyyiw')||'000000' between #startTime# and #endTime#
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyymm') and to_date(substr(#endTime#,0,6),'yyyymm')
  </if3>

</if>

//外地EC/SI统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_OECSI_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_OECSI_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_OECSI_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_OECSI_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --DEV_CODE=目的网关代码 --NODE_ID=节点号 --EC_ID=ec/si企业代码 --SEND_FWD_MO_SUCC=mo前转成功 --SEND_FWD_MO_FAIL=mo前转失败 --RECV_FWD_MT_SUCC=接收mt前转成功 --RECV_FWD_MT_FAIL=接收mt前转失败
</select>
SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  DEV_CODE,
  NODE_ID,
  EC_ID,
  SEND_FWD_MO_SUCC,
  SEND_FWD_MO_FAIL,
  RECV_FWD_MT_SUCC,
  RECV_FWD_MT_FAIL
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and to_char(start_time,'yyyyiw')||'000000' between #startTime# and #endTime#
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyymm') and to_date(substr(#endTime#,0,6),'yyyymm')
  </if3>

</if>


//网关帐号流量统计
<select id="tableChooseSE">
    <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_FLUX_H</if>
    <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_FLUX_D</if>
    <if test=" '@timeType'=='week' ">IPMSDW.DW_FT_RE_ST_HYWG_FLUX_W</if>
    <if test=" '@timeType'=='month' ">IPMSDW.DW_FT_RE_ST_HYWG_FLUX_M</if>
</select>

<select id="resultMapping">
    --START_TIME=开始时间 --END_TIME=结束时间 --DEV_CODE=目的网关代码 --RECV_SM_ALL_NUM=从账号收到短消息量(条) --RECV_SM_SUCC_NUM=从账号收到短消息成功量(条) --SEND_SM_ALL_NUM=给账号发送短消息量(条) --SEND_SM_SUCC_NUM=给账号发送短消息成功量(条) --IN_FLUX_NUM=入峰值流量(条/秒) --IN_FLUX_LIMIT=入流量限制值(条/秒) --IN_REJECT_NUM=被拒入短信量(条) --OUT_FLUX_NUM=出峰值流量(条/秒) --OUT_FLUX_LIMIT=出流量限制值(条/秒) --OUT_REJECT_NUM=被拒出短信量(条)
</select>
SELECT
  <if1 test=" '@timeType'=='hour' "> 
    to_char(START_TIME,'yyyy-MM-dd HH24:mi') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    to_char(START_TIME,'yyyy-mm-dd') as START_TIME,
    to_char(END_TIME,'yyyy-MM-dd HH24:mi:ss') as END_TIME,
  </if2>
 <if4 test=" '@timeType'=='week' ">
    to_char(START_TIME,'yyyy-iw') || '周' as START_TIME,
    to_char(END_TIME,'yyyy-iw') || '周' as END_TIME,
  </if4>
  <if3 test=" '@timeType'=='month' ">
    to_char(START_TIME,'yyyy-mm') || '月' as START_TIME,
    to_char(END_TIME,'yyyy-MM') || '月' as END_TIME,
  </if3>
  
  DEV_CODE,
  RECV_SM_ALL_NUM,
  RECV_SM_SUCC_NUM,
  SEND_SM_ALL_NUM,
  SEND_SM_SUCC_NUM,
  IN_FLUX_NUM,
  IN_FLUX_LIMIT,
  IN_REJECT_NUM,
  OUT_FLUX_NUM,
  OUT_FLUX_LIMIT,
  OUT_REJECT_NUM
FROM <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in (#discteteTime#)
</if>
<if test=" '@isContinue'=='t' ">

  <if1 test=" '@timeType'=='hour' "> 
  and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if1>
  <if2 test=" '@timeType'=='day' "> 
    and START_TIME between to_date(#startTime#,'yyyy-MM-dd HH24:mi') and to_date(#endTime#,'yyyy-MM-dd HH24:mi')
  </if2>
 <if4 test=" '@timeType'=='week' ">
    and to_char(start_time,'yyyyiw')||'000000' between #startTime# and #endTime#
  </if4>
  <if3 test=" '@timeType'=='month' ">
    and START_TIME between to_date(substr(#startTime#,0,6),'yyyymm') and to_date(substr(#endTime#,0,6),'yyyymm')
  </if3>

</if>