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