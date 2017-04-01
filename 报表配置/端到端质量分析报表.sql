//数据网日汇总
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_LTE_WL_CELL_WY_D</if>   
</select>


<select id="resultMapping">
  --TIME_ID=报表日期 --CELL_NAME=小区名称 --VENDOR=厂家名称 --ENODEB_CALL_CONGESTION_RATIO=ENODEB寻呼拥塞率(%) --MEAN_PRB_UL_UTIL_RATIO=上行PRB平均利用率(%) --MEAN_PRB_DL_UTIL_RATIO=下行PRB平均利用率(%) --WIRE_DROP_RATIO=无线掉线率(%) --WIRE_CONN_RATIO=无线接通率(%) --ERAB_CONGESTION_RATIO=E-RAB拥塞率(%) --RRC_CONN_SUCC_RATIO=RRC连接建立成功率(%) --S1_UE_CONN_SUCC_RATIO=S1接口UE相关逻辑信令连接建立成功率(%) --SW_SUCC_RATIO=切换成功率(%) --ENB_INTER_S1_SW_SUCC_RATIO=ENB间S1切换成功率(%) --ENB_INTER_X2_SW_SUCC_RATIO=ENB间X2切换成功率(%) --ENB_INTER_SW_SUCC_RATIO=ENB间切换成功率(%) --ENB_INTRA_SW_SUCC_RATIO=ENB内切换成功率(%) --MEAN_PRB_UL_THROUGHPUT=上行每PRB平均吞吐量(Kbps) --MEAN_PRB_DL_THROUGHPUT=下行每PRB平均吞吐量(Kbps) --MR_COVERATE_RATIO=MR覆盖率(%) --CQI_RATIO=高CQI占比(%) --ATTCONNREESTAB_RATIO=连接重建占比(%) --NBRPKTLOSSUL_RATIO=上行丢包率(%) --NBRPKTLOSSDL_RATIO=下行丢包率(%)
</select>

SELECT 
to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') TIME_ID,
LAC,
CI,
CELL_NAME,
VENDOR,
ROUND(ENODEB_CALL_CONGESTION_RATIO,2) ENODEB_CALL_CONGESTION_RATIO,
ROUND(MEAN_PRB_UL_UTIL_RATIO,2) MEAN_PRB_UL_UTIL_RATIO,
ROUND(MEAN_PRB_DL_UTIL_RATIO,2) MEAN_PRB_DL_UTIL_RATIO,
ROUND(WIRE_DROP_RATIO,2) WIRE_DROP_RATIO,
ROUND(WIRE_CONN_RATIO,2) WIRE_CONN_RATIO,
ROUND(ERAB_CONGESTION_RATIO,2) ERAB_CONGESTION_RATIO,
ROUND(RRC_CONN_SUCC_RATIO,2) RRC_CONN_SUCC_RATIO,
ROUND(S1_UE_CONN_SUCC_RATIO,2) S1_UE_CONN_SUCC_RATIO,
ROUND(SW_SUCC_RATIO,2) SW_SUCC_RATIO,
ROUND(ENB_INTER_S1_SW_SUCC_RATIO,2) ENB_INTER_S1_SW_SUCC_RATIO,
ROUND(ENB_INTER_X2_SW_SUCC_RATIO,2) ENB_INTER_X2_SW_SUCC_RATIO,
ROUND(ENB_INTER_SW_SUCC_RATIO,2) ENB_INTER_SW_SUCC_RATIO,
ROUND(ENB_INTRA_SW_SUCC_RATIO,2) ENB_INTRA_SW_SUCC_RATIO,
ROUND(MEAN_PRB_UL_THROUGHPUT,2) MEAN_PRB_UL_THROUGHPUT,
ROUND(MEAN_PRB_DL_THROUGHPUT,2) MEAN_PRB_DL_THROUGHPUT,
ROUND(MR_COVERATE_RATIO,2) MR_COVERATE_RATIO,
ROUND(CQI_RATIO,2) CQI_RATIO,
ROUND(ATTCONNREESTAB_RATIO,2) ATTCONNREESTAB_RATIO,
ROUND(NBRPKTLOSSUL_RATIO,2) NBRPKTLOSSUL_RATIO,
ROUND(NBRPKTLOSSDL_RATIO,2) NBRPKTLOSSDL_RATIO
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,8)
</jdbcType>

//小区速率日表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_LTE_WL_CELL_DL_D</if>   
</select>


<select id="resultMapping">
  --TIME_ID=报表日期 --CELL_NAME=小区名称 --VENDOR=厂家名称 --DL_GT500K_RATE=500K大包下载速率(Kbps) --DL_GT1000K_RATE=1000K大包下载速率(Kbps)
</select>

SELECT 
to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') TIME_ID,
LAC,
CI,
CELL_NAME,
ROUND(DL_GT500K_RATE,2) DL_GT500K_RATE,
ROUND(DL_GT1000K_RATE,2) DL_GT1000K_RATE
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,8)
</jdbcType>

//小区应用大类速率日表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_LTE_WL_CELL_APP_L1_DL_D</if>   
</select>


<select id="resultMapping">
  --TIME_ID=报表日期 --CELL_NAME=小区名称 --DL_GT500K_RATE=500K大包下载速率(Kbps) --DL_GT1000K_RATE=1000K大包下载速率(Kbps) --APP_TYPE_ID=应用大类ID --APP_TYPE_NAME=应用大类名称
</select>

SELECT 
to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') TIME_ID,
LAC,
CI,
CELL_NAME,
ROUND(DL_GT500K_RATE,2) DL_GT500K_RATE,
ROUND(DL_GT1000K_RATE,2) DL_GT1000K_RATE,
APP_TYPE_ID,
APP_TYPE_NAME
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,8)
</jdbcType>

//预警小区速率日表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDM.DM_CMNET_KPI_TOTAL_D</if>
     <if test=" '@timeType'=='day' ">IPMSDM.DM_LTE_WL_CELL_DL_D</if>   
</select>


<select id="resultMapping">
  --TIME_ID=报表日期 --CELL_NAME=小区名称 --DL_GT500K_RATE=500K大包下载速率(Kbps) --DL_GT1000K_RATE=1000K大包下载速率(Kbps) --FLOATING_RATE=昨日对比浮动率(%)
</select>

SELECT 
to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') TIME_ID,
LAC,
CI,
CELL_NAME,
ROUND(DL_GT500K_RATE,2) DL_GT500K_RATE,
ROUND(DL_GT1000K_RATE,2) DL_GT1000K_RATE,
ROUND(FLOATING_RATE,2) FLOATING_RATE
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and to_char(to_date(TIME_ID,'yyyyMMddhh24mi'),'yyyyMMdd') in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,8)
</jdbcType>