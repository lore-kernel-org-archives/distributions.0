Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2C361653
	for <distributions@lists.linux.dev>; Tue,  3 Mar 2026 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576283; cv=fail; b=uKdV9s4hM/1Pd2xvduQAqTdS/XPo2oS2HrHpufxLCFXWEgZItnoyxl39EE/Q085tih3Yqm3+ova6AO1gaWHbTvW4EXa1Z9a2vQ4K2RWrpP/wjEyZgM9oEZ2gny+xRdultrXPVksG5Q1gDttVFSghQ7yeMgQKoJsrVJntdJNOx0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576283; c=relaxed/simple;
	bh=VVpk9uE7DGaVJPiwBdFqncQEHL5lnR5vAMpBOqd1qTw=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=S30FumA1W+bTXT6b4aCVq9HPAnnGER1V4Rgr77H9CM3auzifr4WUw1wQEEay1rdb+E+GO/8i+GcY6FVOLmC9q3brnQe/I38gH8etm/gAI0IRwNMWDdtTRco4m5yoW318u0CSinfxZ9HKbpv26U1hIIL2uPrG/LwsJCb5FNMaKuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IW6ffndZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pBWwOGW1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IW6ffndZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pBWwOGW1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623JeeuF1125211
	for <distributions@lists.linux.dev>; Tue, 3 Mar 2026 22:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=m2lC++KKWUBx2WTd
	siqu5AMVqyvyprNLMLHit5k6Bvo=; b=IW6ffndZeUuJ5H/eMhvZ21sn/3fEhEZT
	83D6k9AfZ25mGmennjuPqmzNuFcnPCGfytHMWfl3Ykp0pKJVYFwG4gguleITSPD8
	+TrHVQw45fKGazguR2m1O5KysFTKwO1BI7CHerSDqWylLfmHAaQQrVH9wmV31sgS
	aDtE57SOXHaTy55sYDnGeQY8wyxjJzugUsGD/TL/EiW2lX2xszTwCK8FxPTP/j6Y
	YGzhK1eMscU8Asl6Z/oXCVjWcL4QrpscimtM1Uc0DUP9LAVBembttRZh39+BSkJo
	oe/qQ5E68P1hI7oZQ0VqRUDr7Xu/2TB9fv74scZiCpxqKzteA/4EXQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cp60m09c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <distributions@lists.linux.dev>; Tue, 03 Mar 2026 22:18:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 623Lj6Je037193
	for <distributions@lists.linux.dev>; Tue, 3 Mar 2026 22:18:00 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptapd7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <distributions@lists.linux.dev>; Tue, 03 Mar 2026 22:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4ed8yqLQjdPJ3HFmoR3+yjVtbuWzBJDGwV7/Htb3rNKVLTLVzsTjacxgv+UdSk/uT1+yVh2JyLcf3jrVVYegWWnkj5/9Zo+l1M2REuP08AszRL/Vg0ZFs56gwMoWgyda85okHd7ULUT42cE3xV7Nq0J7q5bkoZQ3/ajnG8PdZ/leMK5d3ifIyIrII213u5XiM4YUuVHET6GQVPYNbzO2y51N7Of9RcsfZE9MMts7zPhjery34P3a7Wl+14yyvMWEIgGzk6SJNPIaVMkqJ38Ra4q+Ji7+IEIP2Lh/fub342x4nr96ABqD2rhCID/QXFG1UEgkLScXgNq+EjS97CaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2lC++KKWUBx2WTdsiqu5AMVqyvyprNLMLHit5k6Bvo=;
 b=fCzs3zd6jBgRZzfI6KMNIdvoa7L8C6g4t7ODNwPLrc/SJUcsM3U0TQ/R0BNojWIehfZ9EtEt0HEmmP++n+NuM30264R900rJj9VByiSzjOk5bbcGJ++1/X5bHFnT6D338YE6yC6OC2CaUYFiK6+lKps2reS9KYCl5susmsHv1PgXJD0HORyOkc48AXTt39pEYp60UPPAEtag6rRvJnK9BQZ4VaIWf/dL/S/90UYPc8WbVxYi0oW4WgBTge3VKb44FX4WI6O6H7pJOD1SFupBrqdxUOQwr1R34EYIHj0io3H4Tf5FQ/z0leuZeUzwVLoZh483X+KxQ/qwIesil7limg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2lC++KKWUBx2WTdsiqu5AMVqyvyprNLMLHit5k6Bvo=;
 b=pBWwOGW13CsR7055eXi1T7GAREtyi81X9RRO3KMrZN18Jv7yMQyMDpLob1gfIWAaJ5aPhET3lZ6X2Eq5LxtqYUguQTk90KZ9TyCPd5TOP/8YxAjAvXWVwoAccGpJ5K5+lh0apSrHVEkBvSWQit5eDORFqewN/dhGmCV9Ata5AUY=
Received: from CH3PR10MB6739.namprd10.prod.outlook.com (2603:10b6:610:147::6)
 by SJ2PR10MB6964.namprd10.prod.outlook.com (2603:10b6:a03:4cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Tue, 3 Mar
 2026 22:17:58 +0000
Received: from CH3PR10MB6739.namprd10.prod.outlook.com
 ([fe80::2f5f:44c3:faec:55ea]) by CH3PR10MB6739.namprd10.prod.outlook.com
 ([fe80::2f5f:44c3:faec:55ea%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:17:57 +0000
Message-ID: <3061027c-4e67-47bd-b8d9-1d848acf3a38@oracle.com>
Date: Tue, 3 Mar 2026 14:17:55 -0800
User-Agent: Mozilla Thunderbird
To: distributions@lists.linux.dev
From: Alan Coopersmith <alan.coopersmith@oracle.com>
Content-Language: en-US
Subject: British Columbia redefines "Pacific Time"
Autocrypt: addr=alan.coopersmith@oracle.com; keydata=
 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
 5V9JclVH6u5Gug==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:510:325::22) To CH3PR10MB6739.namprd10.prod.outlook.com
 (2603:10b6:610:147::6)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB6739:EE_|SJ2PR10MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2bc4b2-7e5d-4ad2-fd30-08de7972b8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	HOLHMVgYh7MLJdKYOIem8BNxQ+0P4TJKcTXgk8dEpn5+9vHexkb0i8Wh1wB8shNrZ6z2AAuV3O+J1Lxkb6NNXk7UK3D01qcSTqBgKv3CC/vW6qwm+hJ8DoVN/VXnkEBO3OoTnyZrDD/I7hR7CI2TIfybXNDfkFkbIDION74p9/vizTv/F/SALzIpvdUeg1sBKk/FtegZoaZIBsoUtX3kSNwz/e00+2PxbnIc4+48ieX4rPgZKp/x0pQG7BQNWIYnNEb5ry3Tg+LqqZhJHS19AGS08YBjzS/aOopTTvVxKeui/yx5d7IYPzMc1PBRUgDwKlg4H0L048bEesuhmSilCwnLFHy1tRuFgTq966prycyhmF1YxvgyS4FWRPQ0wTAVGclYkeM+NQ6TOMjzO4r+fOugZn5QKGX1/EF9ifCaKw0euA1ENKhUaeTerOv3q6hFkdXCKRmB50BurD6pGfNW3toFx6E/u1LTUl6aW2bzyFubtlPRz/H/ud5DRDXb8c/SCY1rN9jFJVR5RJjQLIXSo1PaUMGB5nHVvrMN8op0hEoeBZoPnKsqxFBnqOwvQ3ahRH9sRKUAb7J0nYGdl8JafDxU1KNgprSkC8n8l1kX9eR3ztp4DsNp05sjMjjchyuY5MMvQkrCkSBkHPH/pBvEcY0AQLd3zQJr8Ff2UAH4p2Tkkyh+PKKy2rlpEdcbjqG/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB6739.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejJDL25ZUnVIT3JlMWtvVVdQOXRreEhWaTJ3ZzYySEpwcW4wVDdVSXVSdTdy?=
 =?utf-8?B?eU1iWUtKOHBFRVdtaCtvR0N4bGtHcDdZTzJhZ3JobDJGYUlCaWpDZnNRRWdn?=
 =?utf-8?B?MXU4TlVNYzNaWTBRMnF2MjNYMTFXN2pFMi9IOXUrcStia0ZndjZzUXhrWkZF?=
 =?utf-8?B?SDJyR3l0WHRQM3dhNXhlWFdxMFBEc2xnNXZqQWV2UGpHOThrSVc4VGZHKzJ3?=
 =?utf-8?B?MEdjQllMQkVLd1JySTRyeXM3eUlqTG5jTmZ3MnN1VWRlRHBvS0xrM3lFWm5G?=
 =?utf-8?B?WWVScEdDaHhKUjRESnFYSG1EcFp4aUR3bWtXbVJnNGVTS1pPSU9ZZkg4UlJR?=
 =?utf-8?B?UitRS281VnltdjFFL2l0UVlkdElHeVJEZFRhRzhVdVpDdHFTeGFGZDdtUVZO?=
 =?utf-8?B?ckpIOUdzTkNJYzVuNVRROC8zZ1lvZzVEdEZhTVlPU1J6a3pzbHB2WjZGUnVG?=
 =?utf-8?B?MzR5RUlMSTROc0lJV2wyWG55TWdtSXJWTkhNUW5kb0dPMGt4WXVUZ0kwWUNj?=
 =?utf-8?B?UUFEUTUrd0xFN1ZEZlozNkoxYis5eGNKL2F1d1RxM2dHdnZDR05tWEhWSWIr?=
 =?utf-8?B?NzNYMTZDbDUybnlzK2NPaStuckJ6UERKRlF2SVFTMzRsTmZwK0puUFRhWTNj?=
 =?utf-8?B?aWNHS3g3N1htZHpQQmJXWUFhNjk0clZWY0ZxZUVNTEVFM2xvRlMyUDJ5VDI4?=
 =?utf-8?B?dzJPT1QxdXVRRklMZDdkUVFYWUtNWUsrcHhUT2h0bUhmUC8zaXdrZ2FPdXov?=
 =?utf-8?B?akJ2TUNoRkhWL05CNmVSWWJrTzZ4ak1saHhkbzlBcmV0TThRTWxkM1NHNjU5?=
 =?utf-8?B?em1YVm8rTFZrUTdEQXBRREp3S0t5cEtZY2xkeTdycWtWcUwxMXA3RURJc0x4?=
 =?utf-8?B?NExFYy9QWk1QREJiTWZ6NmdmZDR0OW9qTDM3Y0lFZXQwR3dQYkxjVXBZUEhJ?=
 =?utf-8?B?R2hEcVNFMkliOUtYY2tCSlhXUjZYQXhPaEJhbVdCSXR3NXlUVG9yeHFKbWNk?=
 =?utf-8?B?K0wrMm9SblUwNFkrcEY5U3lVNEdzWXQ3d2ppTUYvOE1wMkxBVFFXWFVxVWtm?=
 =?utf-8?B?UzFSaWJzNjRXVFlLejVjUVlTdWVRbGZ3TW1ocUVETk1RR1I4OFBKdUZtalha?=
 =?utf-8?B?SDNHZDQyakZtT2V0MzRqUWtOSElzYmtwUHFpSVlINVdkZWpCYUpMUHR4MkJJ?=
 =?utf-8?B?SGFvcHc3cXFXRXZvbUo5SVQwWG1KWHoxMzZ3dnB1c3ZuNGJIeXBVNFRDNVlM?=
 =?utf-8?B?QmJvYmYwTXU5NlJwWnFWNGY0RkVNNmU5T1QzYlByQkVmSy83enJIckt6Y3ZQ?=
 =?utf-8?B?TVFmV1FQdmhxK1JZWFRlOUNWL0RMcW9BN3Nwdyt4RmZIendCcmFHcVZDL0NW?=
 =?utf-8?B?S1pSSTZjTHBqdDE2ME00R3E5OWFiYTdTMWZ2OHQ3NHJCM0pSRjNCTTFNU1RT?=
 =?utf-8?B?U0RWVmZES0toZVdLMkJZdzNjTnBFZ2c0RERGZkU0bGxCZTR0VXRqTG9kWVFU?=
 =?utf-8?B?c044eWdFbDdLa01BOVNzNWxGbWdxU1c1Z0RZdkZmYkRibytsemd6UlZqdmNP?=
 =?utf-8?B?NUplN1J0RXZUUWR3TUdNdjYydnh2OHhPNk1iazB0V1QwVkZ4dTNZVUcySGRR?=
 =?utf-8?B?eFJmMHBjd1NOQjFqRlF5aUdiM0g0M1BXbC93OXRueEZTZFJQNHBGekFGTjRL?=
 =?utf-8?B?K01pdWJBbzFzci85ZU5EZUdQSktYd1ZFaERQMkFCYzRxbFBRd2w1V2xMZGNO?=
 =?utf-8?B?SEpIMjF4emdodFpWRUpFRGNpYUQ0ZTkwdmE2dHE4SUF2U2g1MDA0WldDL1hT?=
 =?utf-8?B?WmljcGtuVFBrSTZSdVhVdFZrcWloMUl1MUltaWQzcXNUTjJLcld5TENoWkdI?=
 =?utf-8?B?MkVKUlFUQjN4RlByV3U3bkNZWlBvMmRjdE05YlNNZmVLSjZ3YUNJRDRvemZq?=
 =?utf-8?B?Uk82VFNoRlZyY01HVjhpZmZsU0NueTNYNTdhRXRYbXVSYnVMa2lrekJiR24y?=
 =?utf-8?B?VGlSU2RrOVlDYWUxMVF4RnpGMjltSWJ1ZzRxb1NrNE91MGRlTlZIcXZ5czV4?=
 =?utf-8?B?QjUwRTE0c2hRSEVnMFQzMkNqV3JCRXg5OFhzSGMxNjl4S1lpbXBDbG82azBH?=
 =?utf-8?B?S0p0eGd6MGhjTjl0RkVXVTg4R1hJZFpvVHBmSTFubU1Pa0FERHJYa3ZRL2k3?=
 =?utf-8?B?dHZiQmZBc3d3Q29WditHUUhtWjhtckRSd1pQTjZNKzRJWW9sZ2xlTm8zS29y?=
 =?utf-8?B?YjdwTStLNFRzNTJJbGlKUXJja0lLL1FBVWwwVEtlQjk0b2E2UVV5aFh0aTM3?=
 =?utf-8?B?ck9Mai94bU5wQmVXZnJUdUtDM2xYNWZDV1Bhc3AzalhvcEdZc2YyWndpZEMz?=
 =?utf-8?Q?9oZeEofWI9EDOhgo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DvCzRsS4gOyD6GlUy7Ji59psMRzK15n+seuTHjCV3ikl55EYZNUfKNG2PsszfPu+ArYhwvJuQPS9CsX5/OH1BIPqKEMdEPGRVvchmk9bKLOODvti9RD8IhF0Kq/fRXoZ3cFIUhWBBVA+39pxgqJGxYqCSbZMOcYQJVcM2SEOXYhbjzF0Ua+sGaE4VpA5TwXuKAzjavmFe4TnI7e3IeByxLB4j1Pf7vpcO5r0sBtKozLWBJDG98g/BtRuq0IxcNH781xFyMLOFaz8u1IVLS5jBsjZVcM6bqLw37t+lUP3OS2JGal2RliG5/JWrK1Hrv8zHK6e0oMVr0qDpZGDkEwZ3REDJubGy31WQdm50GaNisvkAV3l8V5IaPZy7ME8xSJ4eTlHbWzsZHDOViHCYIZMxCB8/ubXhCLdFiTvM2/MgGtwbeVzeE1n7Qt5yRtGMamE2JGgVq1xEIKYCPO4ILx/o1r+gADY5H+yowKObU9NmpSvtbOXcE3CxV63ws5jqm/sehD2ElaopIoKCzv+htWgir0BHbGoaJhSg+OqlYQd8cyFsYRE1u9XZRrAjDgsjyer21gYWjE88x+yNlJCtGZNsuhqFM2vPEZO6WrxjehgPEs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2bc4b2-7e5d-4ad2-fd30-08de7972b8e8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB6739.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:17:57.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INQE7hepaxqEn8zAGWYVeD+ygHa+zzm8La1BWoa/8oyNME1kpvWz3n1cPIM9kXXSKSiIoZF8rx8MhnO9t8jb6kSuuI2GGoHeIIVTH+7zxho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6964
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603030183
X-Proofpoint-GUID: o4UyYqpEY9DlL6zBiI0O_5Neswijp2WR
X-Authority-Analysis: v=2.4 cv=G9MR0tk5 c=1 sm=1 tr=0 ts=69a75e19 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=I0CVDw5ZAAAA:8
 a=mAfMTu9_AAAA:8 a=yPCof4ZbAAAA:8 a=9mfYUcNpZ1KTfQ9AeAUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_TFuK5Zpjvw18ArVKvsC:22
X-Proofpoint-ORIG-GUID: o4UyYqpEY9DlL6zBiI0O_5Neswijp2WR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4MyBTYWx0ZWRfXy92s5G9l5Ljd
 3Ng3y3ub2R4JserTs2EWaekv8fI0yZtoeRwMEcVy+1ydh2WRgDuyC+K7u5vlPKmdh7jjlxpvTqE
 0Mjo8Mvo6n1uilewOqzFkiUrh21ixTIhD4iLoQk3gMCUxxJHLideIiWh1kDOLLVw0dzHgo/0WIF
 XGCq7QZj2i9N+xlK0KdoUltXyKGAOgHa7Vg+S/2zE+ONwqhyNiDa7UVTKjdPl3E7NmnblRo8gFP
 3OriCHegcnHj0CnoOHLttgvfr2pabcjINrY3Y9MhR8j2YHO5nK/xATK5IfwM1svnMP5v8TFWa27
 YlGJnkzfj/FvEWQc6f0cnu6SRH90ad7ZZGQJGrtkQe0KVE6HRwrXTgbqfYtzC+6Vqh6vv8548+o
 fTFFyvrAHmcNFBLvr4dFxbvxTfB2sMZF9kD5din2nyllFGoi7StEzX8ndwS0NRTBrWAS3pBqYrg
 jUlpXEBMEZfut8bD79A==

The Canadian province of British Columbia announced yesterday that they are:
  
   "Adopting permanent daylight saving time: ‘Spring forward’ on March 8
    will be the last time change, ending twice-yearly clock changes."

They've given us 8 months notice to deploy updates to timezone data before
their now-cancelled switch off of daylight saving time in November, but of
course, because naming is the hardest thing, they've decided that even though
their time will now be the same as Mountain Standard Time, they have
designated it as "Pacific Time", leading to the IANA TimeZone database folks
having a bit of discussion on what timezone labels to generate in output time
stamps:

https://lists.iana.org/hyperkitty/list/tz@iana.org/thread/667WE5QTIA7MP2E7NC7T3SO7VLMZLVZS/

They've also pointed out the blast radius may reach a bit beyond their database:

> Ruby on Rails' ActiveSupport::TimeZone, for instance, attempts
> to "[l]imit the set of zones provided by TZInfo to a meaningful subset".
> It maps the string "Pacific Time (US & Canada)" to "America/Los_Angeles".
> The baked-in assumptions, once seemingly reasonable, now swiftly break down.
> https://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html

-- 
         -Alan Coopersmith-                 alan.coopersmith@oracle.com
          Oracle Solaris Engineering - https://blogs.oracle.com/solaris

