Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C343F9454
	for <distributions@lists.linux.dev>; Tue,  2 May 2023 21:59:46 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342INdWG029027;
	Tue, 2 May 2023 21:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : from : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2023-03-30;
 bh=wkMhSEVocPrnWzRa2qOjSA30tdA0E207FK8pEls1id4=;
 b=FXhULqTI3TE/R0pWR5+A80lwLmR+BvV7mu8FBc61jJx10NhkRh79Fhv/IG7ybgqvC+3c
 0vgGnP+zFVT+75mBpz6QgnBguY5xy4yid0KS4dCr8P10Pdfg242GgnTwdCoX+1nVfnf6
 Q/2zp9Jgmk/VPidR+FYl4TzDx1Pi4gPuq2d6h9uUOtYmJR0vvb08ggy3UlZNbf12jmFy
 83+a1Yu0lYPB/7JYBg8zKH5eswQS6hMphXPSDaBkaGpxvD0h9rMQul8adddZ9zrxQkC4
 CiYSyxSDn7I8SZd0K9QwSAxbtr8KC4yn67T/74Qps0KcxgupNBdW20xYZQtXK3kIPSuy Pg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q8u9cwyw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 May 2023 21:59:37 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 342KUIff020742;
	Tue, 2 May 2023 21:59:36 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3q8sp6ba0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 May 2023 21:59:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agLtSP+2kI/HV5VAkz9GXTE5EuM1DbMHoTXrBa7W6J4wgWqFmZ1ILmkOZrn8FE82Dd3cPnH66CsbnxfOwk2TxmF0WeZFBF8nKZ/W0KgfX64IAq74EWieJAKy6XieOjM3AwiN+pKbgh3OlRLEKn0tFUUxuTVjoJ6qY2UTQE4IdXWsobJjzhwfUZq6F9Bg/zqRssTKSljmQ29wrL4nedtuu8d6tVujouCq9kCUsZgtNgPHkdov8q85Wj4AwlqlcvZLu0al9R+Xhzs6+RSAergPTkde+L3tC8DmhU+k7PKWw+qBsilnIvdZPN5hHNYdkSFN51BqQlfM0EchGjXaBW3xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkMhSEVocPrnWzRa2qOjSA30tdA0E207FK8pEls1id4=;
 b=L7+hoYk6Yo+h3kXTABbVtd3NhZz9PmwxYpBmGk6TIKNpr1iV1yYXQsMv3MH9EOKjhtYM50+dMGBHmrpJIsu8mV1IcRvC/reeyc/RvaEQELjJXha6oN4FhZh1Cb/RbfOVXVUebP6FsHaEMeGAfTaih05CAxUwEu5KhcJhPai4szKAKGsc99tm/vmBaFaxNJCGnKafr7dCLAsMLu5OmHZHjsgLK2pJaAAFlZreP2ElG+tGzpHCOp0eiUMJeC6xa/CZrOV4YGRVY4cGniKgN1wAX7sHQNMWzh5/yJE6TAecAKPUU93Sntg1aYlTHCwEHr3oGYXC79z0KHpSfxCIVDAjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkMhSEVocPrnWzRa2qOjSA30tdA0E207FK8pEls1id4=;
 b=xQoyOO785B7W1Go5TCRiGXAHuoADNQbeYaenF/Mb/GEvGwBiZjx77sIox0WwYVOlEE7NzccFk6kvFeTFD+4bTN7CgINWjyQ/HL7JZeRQnwKqG04zdCKgJ8JuhmjwDK4zxX1RoXonsFTmNA/nih4lvVL0rmmPzc8NPIDxcEK7bvc=
Received: from IA0PR10MB7303.namprd10.prod.outlook.com (2603:10b6:208:40d::5)
 by DS7PR10MB5927.namprd10.prod.outlook.com (2603:10b6:8:85::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 21:59:34 +0000
Received: from IA0PR10MB7303.namprd10.prod.outlook.com
 ([fe80::14a6:dba4:8b9f:80b3]) by IA0PR10MB7303.namprd10.prod.outlook.com
 ([fe80::14a6:dba4:8b9f:80b3%5]) with mapi id 15.20.6363.020; Tue, 2 May 2023
 21:59:34 +0000
Message-ID: <1ea25603-171c-062e-bc02-bcdfc3acd01a@oracle.com>
Date: Tue, 2 May 2023 14:59:28 -0700
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: distributions@lists.linux.dev, distributions@lists.freedesktop.org
Cc: "X.Org Development" <xorg-devel@lists.x.org>
From: Alan Coopersmith <alan.coopersmith@oracle.com>
Subject: Retired X.Org Packages
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:254::8) To IA0PR10MB7303.namprd10.prod.outlook.com
 (2603:10b6:208:40d::5)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7303:EE_|DS7PR10MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: d540164c-2097-4895-afd0-08db4b5883a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	07Z8RdSywSqu5Z/n+2UJQ7m+ge8I7cve8S48x+gecqfwf+IlUUTh19l93OcH+ktVCPw2leS4rptWfOB0pYx/jodNd3INQXfaeSoyY2gKU8h2gntqg5Fgrtmjauudszqo89fiXYq4ORCl0fTaYTtj7R+VjmQsjBd+jeaZc+Pli77KRulfqrtsm2N0fvoKAz+BiEWFfCzsRHTekPH8oJVqZlwXkmofluHE9HH05jTEEvfWIY+cCUq4HPHsIibWErpTPwHBBF2T4W2QSV5ZF7yu96XDcM+OwpaKDIAbo3bttZkAFQz7htSMSlmstmK7lejL8OEGjHOsc4LvdFUm3SV8S0BU4+j1SxZdVHMNvxoAJkyFLYSjZkQbTnhE8+b3ZmUswSyqyAdzH8Z46bdplkIo+Mjqy4ioJr1CwBYmqrbXU/fyUAZQ7OxbPf1TLILNwXs1+fQ19RUT3CNDmV9m3OF0yOJlPZ+IaXrIPjSm3oFfbYhSdo6pf7cE272/FHoU8qL3460wA0lgVkrOUZF+qFk0MN4yYyQgDFcDUmH5oYDc90A0w23fIv8MnKNBuT5KImc8RVX1YGMJNxi5cAcpMbzG7qaXX0j63muZQcRgOeyILRhQ6yEk8SGCAO1GPgiBkbxHgQwhTV7Rdclbup8WprGFuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7303.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(31686004)(36756003)(478600001)(6666004)(8676002)(8936002)(5660300002)(66946007)(66556008)(66476007)(2906002)(186003)(6512007)(66574015)(3480700007)(316002)(44832011)(6506007)(41300700001)(4326008)(966005)(2616005)(26005)(83380400001)(86362001)(31696002)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDIza0VRNUI4WEhMaGhFRndpbFlDWVBHOGk3K3NnNVp5cE01ZWVneEpMOTR1?=
 =?utf-8?B?bzlMcE1UN0tNOGVudi94UEQvMFFKcG9pTjdqMlhjajVHNGtZUU1lWFhaMFFV?=
 =?utf-8?B?TDR5enA3eGlGS2VmYXpYUGtQcUVRVVluNGRSQXRKaW9PYW5YVG9TQk8xeldB?=
 =?utf-8?B?TlU1ZUJJQ1BTZ3FoV1RaMTV2VVl5SXZNNDNuSW50Rzhka0RqcmNROGg4T0Zz?=
 =?utf-8?B?RTlZby9rOEpmUTM0SytNUUIxZ1YrWWltdkNUTWVNMmEvMXR2aGZNd1g3MW1k?=
 =?utf-8?B?VWdTNE5qNWlDaXZYTnI5T2lGTStEdWdESTM3aFVhbHYxaXhhTGdGUFJYaisz?=
 =?utf-8?B?akxjR3hZalZTTzkrdkFFbjhXOEpDYzZWQm1BQ042MnE1TEluVjkxVlJEV0Mv?=
 =?utf-8?B?ODl5aFh5cHliekMzaHFFdnNVb0JFWE5KVFVsZWFDcWRtZmlSMnFuVFRSRXR5?=
 =?utf-8?B?TUZaWXpuZDRkb2doaW1hQm1IRXlZbDBvSlpHYmpXSXY5Q0hDemZNejdlc2cz?=
 =?utf-8?B?U0NBcnR0S25mS3REQWFyNTFkN0JUbnh0eTRpc0xwNGdrb1VtWDA2ZitpaENi?=
 =?utf-8?B?RFZsSUZJOWNqL1YyOWJnQWcwcVpKQXErOE9JeU1PemxuWHJQbzhwbGpvdUdJ?=
 =?utf-8?B?MXpOYzJnaHQrcmFDOERNNExVSVk2TlcvSEhld3ZaeVdJYjE4RldRZGxONEJr?=
 =?utf-8?B?ZURYRzBITEtFS3kzYUFHVGR2RzdMUnArclFNTUxkbWpvZW9BTWM3MThySlVF?=
 =?utf-8?B?SDl4ZDVQbjQ5NklBbHhqUTVya0hQbWJCWFNLVERQOW92Z2REZlZucjd0S094?=
 =?utf-8?B?cFJGN3FRMVZyQzcxOUppTk9PYTVFWjl1Q25MbmJLaEpsOHRBMisyMXFySDBE?=
 =?utf-8?B?RGdXMU9KU2c4SnZhTkhTaFp1a0R0NUhrUUo4SnlYeSt6c1FEMTR0OHJIOWh1?=
 =?utf-8?B?dE5BeEhGdUEzVFhRdnlTaEZhU28yWVNidzNNQ1RVdTRaOWNxRlMxVVF0TzFS?=
 =?utf-8?B?VWRuVitOZDlDdWw0cGdaZElRRDVTWHdGT3d3M2JJVFNEQnVSQ25uMnBFMW1l?=
 =?utf-8?B?UFVKZTFMYS9aOTQvZDNtU1RhWFdyRHVoZjNKTEVmNkJxT1FiSVpDUjZ3QlJ1?=
 =?utf-8?B?RjVSQnZjQ21rSWRaYzJlZThYVmFDRWdsMDgzWjlYNnBmN1NBQThiS1h0aCtS?=
 =?utf-8?B?aHNzUVdIK0RESWtKa2xqc3dmMVdPY0pYdHZ2UHgvd0ViK1hRODM1eW1aeGVx?=
 =?utf-8?B?NkgrWFp4d2Ewd2hOY1NUMWhvMTFGMHprZlNvTHJpWkt3NGtxdUR1UzAyS3lC?=
 =?utf-8?B?eE52eHM5N2dJdXJaMEtMWGxLVFMwTjBKazhiNm5McGlKR2ZUTk5LVzhrNTZI?=
 =?utf-8?B?bDIveVVza3VYazNGYUFsSmdHalBYK3ZoQ1JnNmRMaE1KQ0JKemVmSWMrdHAx?=
 =?utf-8?B?a3FYT2t5aW9jaUgzMzlkYk9odWRMNVZCTVltdnZxVmhBcTc0ZFF0bUtndFpQ?=
 =?utf-8?B?d0hSdlRaSHZtS2tLcmpoMlF0NU11NXBxdFBxREFsUm15WGI1K0JVc3RnekY2?=
 =?utf-8?B?QlhNZU95WFQxV0phZXZHdXhiVmZ4NVRad0NsQzFHYjdVRWNPTHRTUnRJcDVt?=
 =?utf-8?B?eEFwVVl4aEpDOFRmblhuV0ZlVEkyamEzdWZPK0hNUFFSemoyL242M21hSGdt?=
 =?utf-8?B?YXAwQUk5ZW00ckdjOEhnUWVmbFRBNHR2b1AzZG1kM2tWN05OVFZvQjRYSWFZ?=
 =?utf-8?B?K2NFdklnQUs0Ymo5b2NoWG0zdnVGMXRvQ1BzV25oU0VFc1J0b1FjNUQxSXA3?=
 =?utf-8?B?bFU1eFl4bTN1ZnFtRzRvODZ1aWFGRVFxL3NOL0xZNEx3YTJMcERLY1dHYVVj?=
 =?utf-8?B?VXJ0OVZOL2FicENMNk0yMjFvVkJHcjhnMjliZlJaYWllU1VCUzZRM2NaalFr?=
 =?utf-8?B?eWE2TkVSb2Y0dkRmdDRodnppTWE2ODZyVGpOU2FCYStaY1pCNVhOZTIybFBv?=
 =?utf-8?B?eng1RVZsaHpyZFQ1SWRDbmpLd29tLzZudFh1anpFTDZZRmxPNVRLNUJheGRn?=
 =?utf-8?B?TUZ2R1liY2hLZmtxYy84aDhKclFZSUV3dEZWeW1pMXpJeGl2NE44ODNsZjR2?=
 =?utf-8?B?U1g3MzUzLzd3Uy93aDZYcjR6RnE5OU5GYUNhajUxakF2VnU2N0xDcURkNndl?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vU6tqO5C8GvyXJjz9F79ckrQf10HqBO2D64/YvX3sqe/bc1JVK8JAqrXl6tlZbfOMKYjMUWmet2VI5zDB6DocfoDiH2iinTjGX8cZwPJHFG8J+BMrkl71In9d2WRkt7OATTDUFIta0iizL6UVQqm9iSZrOXVp86yRESwEwAAnjgqpLoTdEu2lyxUZG6pB2F9NuUa/XjVBA+Qstq8oVTYv5vG4PJeWlBMXoCMIt+gAVdSHMeeliEv+asYk1cnJkqJwwfH5zdeQ9J1mHTYdhtSienxINg7ywsIQai6zqYRGp5mP3NclHKcZGvbKqfMZfDcN5GULdfYDBS8I7TtIBGdVcGDJ8zMbk+rKjlM465coOkfnOOaMiz2CTZMoxxruDcuUmpkO9ztW7FqZ5RNCwa775bVqOpuL014qjXdxBAwDtjeKk5le4Nx7n5k8E3F190RIYoe0lHQ14kZOVXcbd43gMa9Q09HeKyJ5YdAOiqVz7CTEx8hUt1Dd5XOw4CCr3qmvF2JOB+Bias7JFy0guOQ4ijp9NZD7bAGoj5u+1ao4my1+PbJQe+2hgbW3oS2SDikHEbwwVmjz6bO79lXPKGwUwPTljdTEd05+5V7WKGhKVnjw3yPfGBwEHmXArUC4qAy9k6iO8q4x9gxIm8FVD2KrDru/9F13Xw4AgdaIVOIGSuGYr/Zt/KZOnm1P6cxZg7g1EGP9eaOQiRezMYsY2MOP3hbBYncfQxlXWcrt805swpZVqBIsyDgnC6yaDI9WTl7NsLGsEZcTEtFXE2dVYO+zax8hoteWDGJGINBeo3waZSmrG22DNoYjEsRL0TUwrI9DbHRx28sjww+ZGFObgYeYqVU7/Nh0LvmuTIFTNgZY0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d540164c-2097-4895-afd0-08db4b5883a9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7303.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 21:59:34.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xd42aQzgmz1aRsbKFsnm+vG1VEwFU1SjnZVrgBVJlQc439CFjSdjGO3AURKtsYWfwlQ5HZ3XAPlXNhCh3Dtchb6RF1K/xGw7G9ubey5vICU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5927
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305020188
X-Proofpoint-GUID: G7kwXb9CLnLlJaFKtw_EihTXOSwA4p6N
X-Proofpoint-ORIG-GUID: G7kwXb9CLnLlJaFKtw_EihTXOSwA4p6N

We've gotten a few queries at X.Org lately that suggest we've not been as
effective as we'd wanted at communicating the status of some of our packages,
so I've made the following list to try to help with that.

We have retired the following X.Org packages in past years - their gitlab repos
are archived, blocking any further bug filing or git commits, so any distros
continuing to ship them are doing so at their own risk, with no support from
upstream - you are their upstream now:

app/lbxproxy & lib/liblbxutil:
  Support for the required LBX extension to X11 was disabled by default
  in xorg-server 1.1 (May 2006) and removed in 1.2 (January 2007).

app/luit:
  X.Org stopped maintaining our fork and encourages use of
  Thomas Dickey's from http://invisible-island.net/luit/ instead.

app/proxymngr, app/xfindproxy, app/xfwp
  X.Org has deprecated the X11 Proxy Management Protocol and related tools,
  in favor of using SSH's X11 tunneling instead.

app/xdbedizzy:
  This was a simple demo of the Double Buffer Extension (DBE),
  not a useful program.

app/xrx:
  Most browsers ended support for the old Netscape Plugin API (NPAPI)
  several years ago.  Even before that, using a browser plugin for remote
  display of an embedded X11 application never really caught on.

app/xsetmode:
  Replaced by: xinput --set-mode "device name" ABSOLUTE
  https://gitlab.freedesktop.org/xorg/app/xsetmode/-/blob/master/README

app/xsetpointer:
  Doesn't work with xorg-server 1.4 (Sept. 2007) and later
  https://gitlab.freedesktop.org/xorg/app/xsetpointer/-/blob/master/README

app/xtrap & lib/libXTrap:
  This was a proposed extension for X11R5, replaced by the XTEST & RECORD
  extensions in X11R6 (released in 1994). The server side was removed in
  xorg-server 1.6 (Feb. 2009).

driver/xf86-input-*:
  Almost all of these are retired now - the only ones from X.Org that are
  still supported are:
  For Linux: xf86-input-libinput & xf86-input-evdev
  For non-Linux: xf86-input-keyboard & xf86-input-mouse
  For all platforms: xf86-input-elographics, xf86-input-joystick,
     xf86-input-synaptics, xf86-input-vmmouse, & xf86-input-void
  (This doesn't include those from other upstreams, such as xf86-input-wacom.)

driver/xf86-video-glide:
  This was a driver for 3Dfx Voodoo 1 & 2 boards from the late 1990's,
  using the Glide API.

font/bitstream-speedo: Support for the Speedo font format was disabled by
  default in X11R6.8 (Sept. 2004), and removed in libXfont 1.4.0 (Feb. 2009)

lib/liboldX:
  This provided backwards compatibility for apps from X Version 10, which
  was the version of the X Window System from November 1985, replaced by
  X11 in September 1987.  35 years seems like more than long enough to port
  applications to using libX11 instead.

lib/libXevie:
  The server side of XEvIE was removed in xorg-server 1.6 (Feb. 2009).
  GNOME's at-spi2-core used libXevie starting in August 2003, but that
  code was disabled by default in 2015 for the 2.20.0 release, and then
  removed altogether in the 2.26.0 release in 2017.

lib/libXfontcache:
  The server side of the FontCache extension was disabled by default in
  X11R6.8.0 (Sep. 2004) and was removed in xorg-server 1.6 (Feb. 2009).

lib/libxkbui:
  The only known consumer of this library was the xorgcfg utility, which
  was disabled by default in xorg-server 1.4 (Sep. 2007) and removed in
  xorg-server 1.6 (Feb. 2009).

lib/libXxf86misc:
  The server side of the XFree86-Misc extension was removed in
  xorg-server 1.6 (Feb. 2009).


(This not a complete list - you can find more listed under
  https://gitlab.freedesktop.org/groups/xorg/-/archived or marked Obsolete in
  https://gitlab.freedesktop.org/xorg/doc/xorg-docs/-/blob/master/MAINTAINERS
  I've just listed those which still show up with a fair number of entries
  on https://repology.org/ as still being in distros.)


We have also announced that we plan to retire the following packages soon
and while their gitlab repos are not yet archived, we expect they will be
archived in the future, and encourage distros that still ship them to
consider retiring them on your side as well:

lib/libdmx:
  The Xdmx server was removed from the xorg-server sources in
  xorg-server 21 (released Oct. 2021), so this is only useful
  for communicating with Xdmx from the 1.20 and older releases.

lib/libXp:
  The Xprt server was removed from the xorg-server sources in
  xorg-server 1.6 (Feb. 2009), and the separate Xprt repo has
  been unmaintained since 2009.
  https://lists.x.org/archives/xorg-announce/2022-September/003212.html

app/xditview:
  While X.Org hasn't deprecated this yet, you may still be better off
  using the gxditview fork that's part of the GNU groff package instead.

-- 
     -Alan Coopersmith-              alan.coopersmith@oracle.com
       X.Org Security Response Team - xorg-security@lists.x.org
