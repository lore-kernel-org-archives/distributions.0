Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF017D342
	for <distributions@lists.linux.dev>; Fri, 26 Jul 2024 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722015694; cv=fail; b=gz+dzxmMmURUb656BVHmjlMKGVIFk394DAOKrISvm0Xo3BXEogSzPhGvD3tPGVoPPh3s6VKIzwcM9nAgnOJI9PGQIDkJQdw6D6YlzT3CRcJE3QtnhokOh/v67nMA1ZlcV1N+cYW1VUCMWDrNyJo/7c9As/TqvgN54Df2h03FnYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722015694; c=relaxed/simple;
	bh=fR3VkdWIJWgynsZJdQg8ki3OixZDK3XYuhV5vmGzxuM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P2YqiT7jZNs2Z6O7SWVGViLf5qMW2w5fJVCgshAcQQ3BB9O0tTT3iekuff7AawXcI5S7t45IhtYBBUZ1S1cwAgmbl79SK5Ivcp2opiKqJmem9kwfCEdupsAATiaiDqt7AqSDTkQRlRM+uxJDvl4DQQ7SyBP1bCTKO5zrDwhXEh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AHdJjOMj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tt4gUh6n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AHdJjOMj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tt4gUh6n"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q8tVo2012109;
	Fri, 26 Jul 2024 17:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=WewsRnnI6+fm8+UxN0RsOjngScfTJM+W14Shj3D9qps=; b=
	AHdJjOMjTH56aXOhUfXL5Q2rVH0MF9dYajqlrOFUARTjpoF/mgMUe+l2kdiQm0ui
	EGz/RiF7lqUHVjahp5uBlYJCpUXQCfQ6++OO2xJtjnCU4J6at7TEo5EJhKdRTqk/
	InSYaSiCYSCqAVDKcSM604c8XHOYSQBuOhieJD3UfdzT9BX8IWUeDWOdrFQI644l
	EBI0vNcjTBKWWxGlvEKraA1zEEu3S8dwDCgxuYu4lVjGU6Zaf7ZdR5nFzVkjyNYJ
	/ud95mYJwV6UE9BP10Z4Ymf16c/RaNpNm4MjsiHOvwwRs+/6mARfI3J1yGzZhQfV
	fs7QnfimJNs6JV9vtVA4zw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxppa78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2024 17:41:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QGl8NO013516;
	Fri, 26 Jul 2024 17:41:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h2a5y4xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2024 17:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5iY+8m4xmt7LWQ1mYF9zZLsZqVKsqot4r/EqW4ynHHf5Y798P+TvGXAenfwG8V1nY1rZ83QeGNpfDGMwmIXtiyL4CogCmfuf3a1NfleuixTC63aH6nc3Mw1aWUq++wjr7FVlbQSR52BS8sMOwKsdSh+ccAM/l1z3kASWS93THi2XgI4mPO87yWSQXQd6tEYRfY0YtyvM9C8e7FNcvvA6iYrHWTBk5WqlnK2jyRQhx0HtIq3qmon/cxvBI4HReDtE2ynsuU3JEFyZwPRMbuBz4qVLcHnV0zTxaKo42MrzUCDOGhVV8+MXLNr2Ntg2tgIsnxRX2PCyF+M13sTGHIavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WewsRnnI6+fm8+UxN0RsOjngScfTJM+W14Shj3D9qps=;
 b=gfVjrdWxy8qospB8b63MFvVbbBZDGN9i647+uyArJWypaitfTO+k+bUGPCmZcwSdRfgIHqxkImh5WD/nyCmMJSc5Hd2PVFLJpk9KkOaMJWAFrafoFPRAqIf2xJmYFZBiaijwfa0Eq+3aGG2y869e3NQ0QJDEUTUbKtJ8wQS5hG73306EB4v7z5Hv8kW75WyJrgtkbBuNKADsqSB1WfWiiEpieQ50i9SU/pEMqlHO4aN6VWMW5yRB+YXm1DE4sF33xUDxjX1WaZtQF9sl9InKLxJfSndbk+y4F4j1S8C6W4dIlFaWcXhsb20TwDDTu2OX8ruXF7FJFHxcP8kHQmoMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WewsRnnI6+fm8+UxN0RsOjngScfTJM+W14Shj3D9qps=;
 b=Tt4gUh6n3z5Wj45KvuzQ/PrAmmTApGaAxgy7Nv7vJy2ZEFX32sZzodAV2aOMdR6FH9yu2F+DwJxZxoAjYfhYofSN7b7et4yHmC6YQ1mhswJyRVaygsgH/aMrPyzcVq3l1IM6/TrGQK7qqI7kffpCZNwYmef8mYE71Z2fV/XsZD8=
Received: from DS7PR10MB5005.namprd10.prod.outlook.com (2603:10b6:5:3ac::15)
 by DM4PR10MB6205.namprd10.prod.outlook.com (2603:10b6:8:88::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Fri, 26 Jul 2024 17:41:24 +0000
Received: from DS7PR10MB5005.namprd10.prod.outlook.com
 ([fe80::285c:117c:b227:b0f5]) by DS7PR10MB5005.namprd10.prod.outlook.com
 ([fe80::285c:117c:b227:b0f5%7]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 17:41:24 +0000
Message-ID: <a9f3906b-9db5-4c90-ae56-d82825eee6cc@oracle.com>
Date: Fri, 26 Jul 2024 10:41:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: obs 30.2.0 or later: double-free on exit
To: =?UTF-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZyBEYW5o?= <congdanhqx@gmail.com>,
        distributions@lists.linux.dev
References: <ZqNeHWDimc2VH-id@danh.dev>
From: Alan Coopersmith <alan.coopersmith@oracle.com>
Content-Language: en-US
Autocrypt: addr=alan.coopersmith@oracle.com; keydata=
 xsDiBEab+moRBACDH5yKqS3wcc5bdxY7PBNuwKvF5TKMfagmSvuRDtZjjIIWaA/nZ1KboV9G
 q5g7kP7+Kfu+Qgd8u65eVsWwmPW10fXvj3aCU53glx2EdGdrHcgiyH2gEQfPiyBw+trIppWF
 RV0IDXSLMA1FNC92t2nSG/VFHaPTVwcgkIRSfcXDvwCglGdEa6f4uLqoNHP+m4yYnzapFuMD
 /R4+2AJDAvEWKDdYCGZzlawjAmmWyXrmT7/C/mx98qUR473l4buXjHgDkkXXlHqdzil1vK85
 PhrKzNJDCCmlHUJNz+QwiAMOLwpD+kwVPb57RG7y+a5JQ5+jtVw4RlUxZIk/wj2An9YBO3A5
 vR7PdjM32ZJCN2+aM4dYfNzQxQKTA/47icvBaBVTl9rztjg2pd2Aqpc1P/GsIYLGj7XjnnJv
 GAENBHSH1QjpZMJGCTS9oJ+B0/wrIr+pA+MdFgYAb6ojMQJOO6UChjWWSGjMFcs/CeXhxlLB
 ido3DtAETbNTwO6OEfAvdosvTdhJFnwvZlJ+zZGGy5CrF2Fd9PUe9tmASc0uQWxhbiBDb29w
 ZXJzbWl0aCA8YWxhbi5jb29wZXJzbWl0aEBvcmFjbGUuY29tPsKCBBMRCgBCAhsDBgsJCAcD
 AgYVCAIJCgsEFgIDAQIeAQIXgAIZARYhBEoZPAbTXnxnD6TvC6L7nggfLRMOBQJkQs2eBQkn
 DNS0AAoJEKL7nggfLRMO1esAnR4FVD60BpDY/bJp5RC1VXhOVlo4AKCJgsQeVeGLxDlMuhAm
 bcCkOjafqc7BTQRGm/pvEAgAmnlpSWGjmtSGlLqKTuymwBAU9G7Jw8ow27QngXS/86g/PTzm
 yhXzK0uPgeoIaTZlqaHWNKCWJnC6T2btXtaDHH6cElrClYNf94os5sSt8PBDh184W+NtctAy
 Y2dA1pQYhYs8/eXwa4E4cyrrQG75M+CHrbu9Se0vlERARCpNcjNYLpTXRCwNuUvAi905VJ0Y
 XnGX83WbJfNIq+uxnBa2gVzwb2/2FwKOG03Wyb1vs6NznWJle9x61y8/LlEDoBRbfIQTFp51
 R0ue8gX2yMVgh8lYVViHYCBq+cat7p8X41Xa/fN/HfBFPsf3/+bhggNgmaBmDJBxxd6BPB8Y
 EireiwADBgf/UWIxQwwRLkiXPacOoh34MJYQIBTrCC8gVFxetlbEPEH5mueZMJegAPTF52l8
 6REenxdNVz/0xT7BD6VlHHY5DowlbRca4W8eb3gpkX/wfNYDYCHtTifT7ewumTrNZx5mrbNk
 0XTJVOPAP3z7E0rVD2w/xo4p22DzIwfeGKwpHqt1b6Z9fmrRDwaiXaFmwUf+rIiGc/OFcOSe
 46HwTmIyTOt6NVdQSf75jOPbdeM/n1I5svOdWTLEj6QEj2q9UQ98UEPJuMdaotyBFwKlcDOO
 LMSL793fWINrYSskdXhHjaht5wWqI+egO2JfciI/vP1+bEzhpY9llGq+r7WG3nCSf8JJBBgR
 AgAJBQJGm/pvAhsMAAoJEKL7nggfLRMOgugAoIdhGnD9d/IS6fDVgv+4xnOXvyohAJ0VVxc1
 uoPzepWFbgvLuHIMvyjRog==
In-Reply-To: <ZqNeHWDimc2VH-id@danh.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To DS7PR10MB5005.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::15)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5005:EE_|DM4PR10MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ea1a19-7353-4c90-7d5e-08dcad9a2b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3RwTHF6SWtKNjR0S2EzTS9nWXBqbFZVaC9lSVJTZXFiaGtlbnFRcHM2U2xa?=
 =?utf-8?B?ZS9tMm9OaTNIeDg1c2hzTmFRbFd0TmdncUd4amJvaUY4bHcwMlFoN3NMWHM2?=
 =?utf-8?B?RXlIUWhWL1g3ZGxPRXR3QlJuR1NSbXl0UnRxYVJSVTRKeDNIcWJER2hCcnJl?=
 =?utf-8?B?UTRIbEcyY2RRdFJ2WDEzQXFoTUNlbGVZOCt3bkh2NVZKNEJsbjhETllVRnZ1?=
 =?utf-8?B?aHhGOEdHNng3WU1BVHBkSTE5bjFiNUdOdk04ZG9BMFk1c1drMllyQ2lveVY4?=
 =?utf-8?B?U3pmNjFFWjZ3dVNSV3BmSk9aZnlPeXQyV2prWi9BTUkvdkRZNEtibUVZRDZ0?=
 =?utf-8?B?ZGZuNXR4L0JFeHBsalhlT3BxM09lZSsvZGRXdktlS2JxWUFNLzFzTTlLRWta?=
 =?utf-8?B?M0RYck9Xak43amRuYkxoMTNlVlFKMDdRUTV5TzNrN1lvTUhLQVBFKzNRS1N6?=
 =?utf-8?B?N05JWGFtRVNjOHkvSnEwMjkzNlZ1c1c0UXNSSEtJd1lOZktHVnJieXFmbXl4?=
 =?utf-8?B?b2ZsRk5EdmMreHl3U1doNDhrQXJBNHZYaWRianQ5T2Nuc0NqVDZPdE5KbWdm?=
 =?utf-8?B?ajZIcFYwbUNqNGlSNTFCbXhrUjNzVGFQSGpDbW9Ea3hGQS9xcEtLZ1p2SUVC?=
 =?utf-8?B?eW5EV20yOEpyRCtGd1FOL1hDMzlWNEJsME8rcjZ2cjQ4c2xwd1dBTit5UDI3?=
 =?utf-8?B?akRlbmZmRXVrRFY3dE9JSSszbXI2czFTRVNjOFFmQTVNVlVJdG9FOFh2WGJ0?=
 =?utf-8?B?cUppcE1aS1VuejlpZC9iV1k2VWJOaC93T25ndWduQlAyY0xwemVhY2hHMkcy?=
 =?utf-8?B?dFJ2MmhYZXBVei9RVFJWYURJNFREZDJNbGg1Q3dISTdjVjdkcmFTZElpcWZ5?=
 =?utf-8?B?TUZNeEJWWWpINndQOVgrUnBkVmxic0owa0hsandNT1MyWnc0RE16ajdnRFhJ?=
 =?utf-8?B?Z29OT0tjWjhjRDVIOUpQVWFwc0JwRWo3UFZGTjRzWnpmbEV2VDA4OHpoYXFr?=
 =?utf-8?B?Ymdmb2hRYmQ0TTVKOXgwRndTREp6ZlREUjRBbm9tenBodTJXeE52OHNpNjlE?=
 =?utf-8?B?VTNiTWVKYVM2T1NpQVVrSTZTdXltK3Zzcy9tYUlpREYxd2pxUXFQbkluaUFp?=
 =?utf-8?B?Y3VoT1c1WEpSbEx0Wm42S3NLbWU3dDJrVmpYMXpDRHFDWllaTGFLM3Q3Q0hP?=
 =?utf-8?B?WG84ZXdwdmQ4QzlMeGFqOXU4QnFIbU9aMkw5QXVvL1k3QVMxNnVGV0JXWUlC?=
 =?utf-8?B?b2YreldoMU1qR0pyMGtKUCs2d0NLUUhPbVFENDV1V2xza0ZqcDc2Q1FlMXZT?=
 =?utf-8?B?TUlManZ0eFpMS0dpaWFtTXRzRXZHb21uRzF4K3ZVSWRsWm1vdElrdVlYMUoy?=
 =?utf-8?B?dmFyQ1JXMXlOTEtmNThGTUxXRytHMWNaZmcrNDlVS05HQ0EwZmdEdWkyRlZJ?=
 =?utf-8?B?UWxib3M3bGkzZ0JRVjNEbHhESzJuMFJTQTgvZEZYRUdqSUdKUFc1RWVyNUdk?=
 =?utf-8?B?YW12L210QXNiMm43ejRwUys4dWtmK2RXVnpIbTFMc1d3QldOVGNRS2phbGlQ?=
 =?utf-8?B?UEdnVFdXdlNBZjhPKzRkZTMwejEzaksveTZHc1dXSUZQZFJ3L1VCZHdZaGhD?=
 =?utf-8?B?VElwcDFETUhVOEhIM2dxNjZ4ay9FTllyVzZJeXEvWUJUMS9pTnRoeHlLWUgx?=
 =?utf-8?B?ZkkvWkhhTVVId3FnU1hyaVhNNk9iNHBEbmFUUWZjNjhodkpwYWpvTzluK2hO?=
 =?utf-8?Q?NnMw3e9krqpOaR9BP4JVp6Dwsqsex8vI3pcR8Ba?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5005.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXBXaXlNZDJmclFFTGREU0dTV2ZXN0lOOGN0V3FyRWlKZEM2UVpnM3FDVVM0?=
 =?utf-8?B?Ny8wYk5sVU9EYUMrWGR4YUNqQU9ZNm1XL0puejVYVG0vS0NqUlliV2ZaQXlu?=
 =?utf-8?B?U294SG5YWlEzODlUMTBiSDhaNCs5aXFKTGpYZ0M3ZmFPbVNtaVcyZ3MyQnBQ?=
 =?utf-8?B?TG1hRU9QT1NRRS83TmRkdnJSWDBGUmJxZHVzU2lDdzBld1NPUWJCWG5LYUpS?=
 =?utf-8?B?VW9tdEpteW42YUsyNG01Qy84amdZSmhLQmhiMkw0M2RvbFk2czRab29Pd2Vv?=
 =?utf-8?B?MXZWdG50b1V5U3BHWE1HUVFXS1VVaW85WFUxVjE2dlF4bGoybXMwRUxHQjhN?=
 =?utf-8?B?VDhjaU9kYXBJR0xTaVl1c1h3OGkzWTBMWG9wMlBQcldRUmZQYS9aNlVUVi9C?=
 =?utf-8?B?VWE3Z2ZvZm1KMldYZWpLdENhbEVtbm1IdEhxbmtxY1BpVlNXYU5qQ09UcmlT?=
 =?utf-8?B?bmRETGprZ1AvL3FJUEpUNng4WkNGUFh4cGJWVmdLUWFHMzB5MG5EbWhiVXRE?=
 =?utf-8?B?WU1LR2pVcGtuS0cyRmlKTG1EWU5mT2NhcDdvMnpiS1ZBM3AxVmpSRWFMVEEz?=
 =?utf-8?B?V1ZGM3l2VmJrTWVITDZTczBPU0syRFNDeEpuc1h0UHJFRlNVNE85Vm1vSGd0?=
 =?utf-8?B?QXFqdzA5L05OcWlUSTM5elQyUytobGl1WEZ5NHdjaGFKazhhMVFtYVgwRHJ3?=
 =?utf-8?B?cGdvTUQxWS9TNDVzMDFiWnZjWCtLM1dnUStITGNmNlk2dmJuc3NuU0lCVUlo?=
 =?utf-8?B?Z1hyRk1aQXBDWEFObW1TOHB0bGU0UDNEQ2krZDZtU05zQlpRWXViZXcyOG5Q?=
 =?utf-8?B?SC9LbDJxcFRrVnMrb3dZNE1ZZEJEc0I4eE4zS1djbWdlOXM3S1FyZm9OWVlz?=
 =?utf-8?B?Smg3SGp3L29nSXZ0c2ZhT3ZGY3FxQjlmVjEwZmZDTTZTUjZSdjNyQVg1UHZ4?=
 =?utf-8?B?ejQ5U21kSW91QVNtUVlEdU9QQUplcmMwUHJLQ0ErYlQzWEc4cTZ4RzE1YTlX?=
 =?utf-8?B?MURmVE5qS1lvZGxXNEJrakpkOEZVeFpQVlNBSS9IZnhCRkxTM3dJYS9TbEdl?=
 =?utf-8?B?TG1WNU5BTHlzbVlPUzZYT2EvaGY5eXIwWDA5b1E3a05pWG1zaXRxZnBiOWxF?=
 =?utf-8?B?UHk4T0RncHppOW5xVGFTOTBqQmZrTjVnbmdMQlN0QTlJYTllV1orb2tmdkk1?=
 =?utf-8?B?SzBYU0dwZ0RxdUloNml4L3JZRHZqaC93NzEwLzg0bU5pVndvM0QyWkJKTDZk?=
 =?utf-8?B?WUlFUFBzbHY0ZjZ1UFJKZjhWVllVTStXcXlNUjVJV0J6OGxCaFAyOXlwZXlj?=
 =?utf-8?B?QkRtTE12QkJrSm5BVkhnREpIdk9WcEFqd1dQT1E1ak1MMU1VeEJHNXlyMnB0?=
 =?utf-8?B?blNXOENOT3RsWTEvNTR4YzZ6WDNzZWRHVTUxQlJ0WWRuZFNOaTdkcHdJQ3dD?=
 =?utf-8?B?cElEbEdIYWRJQmtYT3crbitSZHFnczc4SDI5N0ZNVXg0OG1TakxNRzM0b3cz?=
 =?utf-8?B?UWVnbG56QmtMYTJvL0xsSElyY1NNYWdaZmRjeVZOSGdVTWRRMEZPS3dZSTRM?=
 =?utf-8?B?T3UwZjdoOGRiaWVyN005aVZPWlgySXFtMVFZVmpLL204VzlrUGk0UGRjVVls?=
 =?utf-8?B?TEpQd0sxbFFpZU4yNzFOL2FjSmdEcklMWkk1S1F1c1orRWRYdGcyRTR6U0xS?=
 =?utf-8?B?cTBjUERrOGxzaC9kMVAvRHFNMFlsTnk5TSs0UGJrWmNReEt3TWpaMFF0MmVK?=
 =?utf-8?B?N2RWNWhRbEhOandScXBsb1VybEgxcXlGNVV3YUkrV2VIQitKdXhTWmEyNVFZ?=
 =?utf-8?B?T05kdmNrSGc1dFVoeXFKelZOaGE1SXBCRDVmUnphYzVYK1hFQ2FNSmM4Tm5l?=
 =?utf-8?B?Y0xlYVlwaHltMmVmYUZhL1U5eERiaGQ4U3AycUZDSWFYTmtKRjVMQUZHUXov?=
 =?utf-8?B?RXZwak93WHJhZWlzdjAxSUxhWlNUKzJkY2xsWHZlQzI3SGJSOHo1ZG9QaWND?=
 =?utf-8?B?L0FpVE1IN0FqY3RYY3ZTUUpTY3Yzb1F3VVVqNTJKRUdHYjFrVnhheWNFQUxM?=
 =?utf-8?B?L2wwbVFMblBvK1AzbWdwQ1RrWWpTR3Y5WnBvenRXVXhjYitTd3JnNjNOMGR5?=
 =?utf-8?B?UUQ3dUszTnhOaE02Z2pPZERjVERXamdwbmg1UlorQXZmVXlMNkN1alh2emk0?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qdn+wS5lvaPBiFAIHyFH+iYOJfpvKqLnN8UEYZFwSWym4FOKF40GJnEeYzCV1IJ5VX/QuxXdGJGFLldkfo/BLcqCzKq2FdWy6DP7w0RIP9aCJZfkJG4c1X/UfLCtcJPVw2dxEgrQAgeiJjRP4AHFe+UggYLEubjg2PzYVbGeWplcHl5UGxAHUlpJ0zQ9DFaTuCComcOarzIUCLKDiZEyUMU3GNlTAI/ZUvN6CU5Kj6DUikQfEWKGvPl4cX20dpRYp2fXrstOI+GGGul4jiAtyMWqLeGG1dhKtpAVAs8tCVygtFnPhWtRuUVzHCFjzYkWMl33I7nmFcQqJPROCoQDMG58Y/pdD3Yrix7i5LvoDmbJIe0RRHMF7XV4p3NUu1sQrXrCykYZpF1FxQqJq2cAncZiGp4GOZm7lleD5A9sx3zlCJsV/CBgvkJjY0oJzE+n9svtqQoY2cXa22JI/clofXFCShz+++pKtsb+5z3cLXLazdFprXDi8Q6TBtaCFhQrCK8x0FoMDvk1AHfjpNRKOyfeKs/SMPJucwwemPSiqBQQQDyjxgAQbY3xZlPtV1evo4rKDoZWyuWPxSMjFfR0dRyIBVBBE7SEVDBjURdJMJk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ea1a19-7353-4c90-7d5e-08dcad9a2b7f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5005.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:41:24.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roC4v8J+xWOjn1q3fB/fXCrRrySlgSv5h861gSw4RfyyjEstLWysPvRtBYynyCUp1u9z9niobGKVDPrTasBS7uem2nlDTYXEtVAAQiBNtKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407260118
X-Proofpoint-GUID: waqFb_42VdWTalR8DF2sCYE2M5obWEPq
X-Proofpoint-ORIG-GUID: waqFb_42VdWTalR8DF2sCYE2M5obWEPq

On 7/26/24 01:28, Đoàn Trần Công Danh wrote:
> I'm not sure if this mail should be sent to distros@
> If yes, please help me forward it!

If you mean distros@vs.openwall.com, then no, this mail should not be sent
there.   That mailing list is only for non-public, temporarily-embargoed
security information to be shared a short time before it goes public.

Since you've already made this public at
  https://github.com/obsproject/obs-studio/issues/11029
  https://lore.kernel.org/distributions/ZqNeHWDimc2VH-id@danh.dev/T/#u
it doesn't belong on the non-public distros list.

You could instead share it with the oss-security list that is the public
counterpart to distros (one of the requirements for sending to the distros
list is that the information be sent to the oss-security list after the
embargo ends).

But since I'm not familiar with obs-studio, I don't know if there's any
actual security exposure here to make it on-topic for the oss-security
mailing list.  While you've described a bug that can crash the program,
what can an attacker do to exploit it?  What will the attacker be able
to do that they couldn't already do?

-- 
         -Alan Coopersmith-                 alan.coopersmith@oracle.com
          Oracle Solaris Engineering - https://blogs.oracle.com/solaris

