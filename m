Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9401EB2F
	for <distributions@lists.linux.dev>; Tue, 10 Sep 2024 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725977572; cv=fail; b=nZumt5hy3pfTuvQSIuFaPmmDhgWNH4c6Oh458yVXIPvI7/e70/6TMSF3h1FRcYOxGcloOwxNRXayzommWZQE3odH7vghKmuUZfAzB1GYVy+ODwMdo9uOFHlA5vqj6T6VIZf/vZcvX17IgrdMjPgz1+Esn12p/OG6yOiTA4hZqQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725977572; c=relaxed/simple;
	bh=ZCZU4oTV1B4wMfnR4P2Kw4x6vMuDxAqB7KiIMSCQouc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vx1V5WafErnFbgu9hRlef14cHkr9YPqLNkiteJXTLyfipKJblCKuab1y/giHG1ovulu9rqZ8V4Rvw11GRXiVbLN1IxMzpy61IRPnZZVuixDUTH1jVZFE8ETRpT14LTPlhj+8pANA1k/gPn0DfhrrLb0RePxVwZpg0kUUq5srVxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J0jFTO15; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CN1qCBqT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J0jFTO15";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CN1qCBqT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ABMWCe005874;
	Tue, 10 Sep 2024 14:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=ZCZU4oTV1B4wMfnR4P2Kw4x6vMuDxAqB7KiIMSCQouc=; b=
	J0jFTO15WxrXIcq0SD7flB0J9DyhzfWgyPT2fYSgRl3n9VNhtBDPs/AZSp/spdVg
	iid3ZtQHHwWN+/pMQRyMvBZ7eEcB2EvXhtZKhcxtkr55VCiMztgaqgsPrpZsFhJ7
	HGgK0j5BpTRF5wjG0J8cbrUn6FGL7qoHHUengMhOuhitRBDkp41Be+6PCkajKFew
	duRbxQ37pi0tqQi10n2WkWdZ9qzIfFY7IZrcfMM6ELg796uX6yB2utHg21+YD72G
	rN/iFF3lVUN3hNVx5Ahs363zj087QiukkwPd4ge1m/loGTGDF1KWB5McyTFKpL0G
	bGFrmJBxDQ6WDtQxq1njoA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjbunen8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 14:12:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48ACv1b7040891;
	Tue, 10 Sep 2024 14:11:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9a2bwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 14:11:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oS14/NAvVcCH7AYEROUdUwMvVv6FuS7tSr5feOsVE2qukE4+xplts50omWEleGgtEFyFcbjPS2kHAUoP4/3PTbh70+MhBlaYPNllBFemwvLln42m/sVYT10fE3lQUXKBJs4Rywgz12X2l7o71PDFsKjqRElDFFt2lhQU1LcLHotS2RmwIBqM8fvUB3PEtYUObM9DVZwBD0asJgSfovhr/nPE2KhThOYlD/lmcewGbUoPGiafCByvTMDECjqd9WcSFQ3Z0k2lAOSXVVBnFVLRHtaFumRWiOlkCR9Z6TqHcq9zWZGHdqja0VC9IVDG36/+fqrj1o/KoqsYxzKepz/xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCZU4oTV1B4wMfnR4P2Kw4x6vMuDxAqB7KiIMSCQouc=;
 b=WZspjx93wNvdZXoKowMwBsh8MHwh1PUhVx34c5JZEsfhF1ZqVnMPzEf0DrnAC8Er9KK5F2a8KMzS+AFuYqtmvkZ198hERo7sztiB8I75pRj1kwIJme6T/ghstO85JHoCKfKHxSLmAPHWDR3X7ZgybHY/mMoT+AXG0TQ10J3qlnHiLJ4Erg1tAB+iWfvzqGdzrwpLw7cAo29xqKmnmlmBvQ2vQce7TW4CA3XG3RCDa3uREWvhFHk5e47c6Ej6yKJ175JKEAarXBKGSrD8qJ+kluDc2GElVMLu5qSd40Kr7pNQcja86nbsTFIqhIycO5JxJUjgpqQsgEQ/wlwLSm+o9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCZU4oTV1B4wMfnR4P2Kw4x6vMuDxAqB7KiIMSCQouc=;
 b=CN1qCBqTyVKMHdZJ4VRgtqwL61jI052czNlyuC8r12cIdbXUGXWoNRwXiENHdv4/shZcf0OU0rbDo3XWrY+jow+9DwCRX8Yq3b3ndteBC6HpeWX73qI357X5/a9NQo5AtYmHOzJrpVyqLRZ/QIEbp2AkAnWF5OjjYFe8nm3ZxiQ=
Received: from CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8)
 by IA0PR10MB7181.namprd10.prod.outlook.com (2603:10b6:208:400::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Tue, 10 Sep
 2024 14:11:44 +0000
Received: from CO1PR10MB4675.namprd10.prod.outlook.com
 ([fe80::18d7:6a59:a6f6:c692]) by CO1PR10MB4675.namprd10.prod.outlook.com
 ([fe80::18d7:6a59:a6f6:c692%5]) with mapi id 15.20.7962.014; Tue, 10 Sep 2024
 14:11:44 +0000
From: Todd Vierling <todd.vierling@oracle.com>
To: "Andreas K. Huettel" <dilfridge@gentoo.org>,
        Jacob Bachmeyer
	<jcb62281@gmail.com>,
        =?windows-1250?Q?Arsen_Arsenovi=E6?= <arsen@aarsen.me>
CC: Bruno Haible <bruno@clisp.org>, Wookey <wookey@wookware.org>,
        Khem Raj
	<raj.khem@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
        "binutils@sourceware.org" <binutils@sourceware.org>,
        "gcc@gcc.gnu.org"
	<gcc@gcc.gnu.org>,
        "config-patches@gnu.org" <config-patches@gnu.org>,
        "distributions@lists.linux.dev" <distributions@lists.linux.dev>,
        "devel@lists.fedoraproject.org" <devel@lists.fedoraproject.org>,
        "glaubitz@debian.org" <glaubitz@debian.org>,
        "maskray@google.com"
	<maskray@google.com>,
        "dickey@invisible-island.net"
	<dickey@invisible-island.net>,
        "toolchain@gentoo.org" <toolchain@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Thread-Topic: Proposed CHOST change for the 64bit time_t transition
Thread-Index:
 AQHa/uHk4mIYc5ZkJUKcsWvFLxFXqLJIcp6AgAASAACAALLhAIAAHlMAgAIi4ICAAnq59YAAoDcAgAGJNtyAALpMgIAAQYgz
Date: Tue, 10 Sep 2024 14:11:44 +0000
Message-ID:
 <CO1PR10MB467583C290D9BCD93CB376D3929A2@CO1PR10MB4675.namprd10.prod.outlook.com>
References: <4996568.GXAFRqVoOG@noumea> <66DE3648.3040904@gmail.com>
 <86y140qvbf.fsf@aarsen.me> <3650049.QJadu78ljV@noumea>
In-Reply-To: <3650049.QJadu78ljV@noumea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR10MB4675:EE_|IA0PR10MB7181:EE_
x-ms-office365-filtering-correlation-id: 1ddfc6b5-4881-4d81-04b1-08dcd1a2801c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?windows-1250?Q?4LjUYUnKaxTIL3RqhybksSAMeQGON6wUdErwecBA26hgx1w6czqWND6D?=
 =?windows-1250?Q?yrxsR39115TZ+nwKd8xCUPJwxT4SJjo/yM4UPG6k/JM43e3hqO1KD/X/?=
 =?windows-1250?Q?HUld87go5DLPnZdRNX/md1O4dh7p8nMiKw8gFmspzg4LkGsZ2IRXNVxp?=
 =?windows-1250?Q?DAsnjnyHwBSsO2zLYC72c0hBvbEp7AvtfpgxoRbfcYfwgVIA1WLiI0mY?=
 =?windows-1250?Q?uAujiaxolpmfd4kM2ACGBtNEtosSAN9TLsJMXKQTkhi9tjghOctwCJ2k?=
 =?windows-1250?Q?YtDgPw8Poa8MX78SeNhA9JGgY87i8cZvstHKo07F9y4lt9L67NNv07lr?=
 =?windows-1250?Q?ZPpzHMZObDHiy3BJ28Tboy2KkpEVL3d6ry2bMGzNs+VwmpnZmwz8HccY?=
 =?windows-1250?Q?r/lY2qkwUpJN0/lhVKP+YeWO5G3ID1z/gdNzGbBCqPTC5ZSyShAi3deB?=
 =?windows-1250?Q?aUUbNysLi8JmSEXstL6lsHJp3z4ZCdbn00u3K9sQ5PDtcCVjzigD+Nhv?=
 =?windows-1250?Q?8wI8sEc1sF8Ff/r9oUkgwNs0DzJLee7Xl1RGvpET4awogjmZuE0KmJRn?=
 =?windows-1250?Q?FeX2JCiavlmVNt9Ie3fQTKoyLttx+lkbgTxhcoN4ZuhSloeBTgFqIw5F?=
 =?windows-1250?Q?SE8YpCtFM95uVyt9TVBJBFPgb9FMlVBaEIF/DKioK58WNXFooNOzSXY3?=
 =?windows-1250?Q?UO4N0D0WDzS5MqOl3ITVMU7vZVaULb/A22jCECo2n5fTILREJf0pY/Id?=
 =?windows-1250?Q?xQVs3ovP0ZHuiwQ7v3KbMXwGIj/2BKKdzDKbTC/6OEVAhfmsRZ8BODGW?=
 =?windows-1250?Q?JpFduZfMGso4F3zfVb3JTh2JmooDQAEpe5F5EnyykBr/4so9xvpMVfQ3?=
 =?windows-1250?Q?bqYJCONqYupynLsakeLAeajYhT0sZxoPvffnjRPfh7qPse7jOYLq+O+q?=
 =?windows-1250?Q?ArFTH33nMf5DDzgYSc+C5AxFKxVUHg9dWEDV8l4cOpsXZbCzJN6Ugn5Y?=
 =?windows-1250?Q?oayppMT84VPD8J+jOTcTtDhF2+W9DRmC5VTWs6OYUb3sNeOmRV0/ffSp?=
 =?windows-1250?Q?PKpp+SccEYIyAOwZ9Jzl8MWoYvrYn3Yv2yFt01RaLiso9t+RT53j0sQg?=
 =?windows-1250?Q?qYGVYf8Z0Z4Bju7KwYNJIN0q2q5KBzUT/AhPFV+5KNy58BfjBkCSw3VT?=
 =?windows-1250?Q?sdKTRx3Ap4mRQtShc82ldLRfZp3CsouU9TlSGvo405Gtm8SFM5811kOq?=
 =?windows-1250?Q?7AIHqQReR4ZOEsziLIiVVaodM1kLMwOSZMLj3L2cFDkmsOy8Lqf8DamY?=
 =?windows-1250?Q?241tFZitci55vW7He1mP8Tkt8IYUqcXticePvrs9a7Cj4jy/tBuy+BV2?=
 =?windows-1250?Q?Dw6lwRnBVfSwd4xXUcPycO5dipXFqz5+t2LcoAuhbqcn3pvoGuYavY/H?=
 =?windows-1250?Q?VnGwaL6Pfw21xvcd3DnypX7r3jT4JM2mfJByjt0n0zfxgass/W0jLkwX?=
 =?windows-1250?Q?KzWrvVpqGqpjAIiWVw0uKIlEmL2Avw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4675.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?windows-1250?Q?KDGe+fwHZhw1rytLWhnhiZKIKYDfgZ+NNwiN5XjFEYezk6vdaze27C7o?=
 =?windows-1250?Q?GY6zu1HQl+9ZueCxGZo71qEqas6xSdCOXE1QdX7YvAGu68LRRJliBhVv?=
 =?windows-1250?Q?ycfRQvtmtaBZR0fpMzv5+nQmAhyrhJ/NEhQ45uXC8mAx3fRjt0WVVLJw?=
 =?windows-1250?Q?HJGtDD9UAOSNvnn5Svew4HxlhbfGjLgp5roxxSiuxXRYBicL9vlIxZVo?=
 =?windows-1250?Q?xBb1hjsaGnkelSoTdZTbC9z+Zka2k4fHDSyQhVQ4Ne72NJuDr6mAiqSL?=
 =?windows-1250?Q?5UQBCV5UoNI0lpXjMQlth0lTvVIIGr/3J+KPmrFHK+tGD9RaQ4tCK/0j?=
 =?windows-1250?Q?7yhCIpFG7HI/+U45CpshL4tBqE98YP285QbywevZZGwlCSjgReSVgwBu?=
 =?windows-1250?Q?Ttj9fNYGOBjMV1WswJiOax3quTsPRHeb5w0b3VQQ24d4LympA27sR1OI?=
 =?windows-1250?Q?HZrVcHgIjUvCaJ87zvgtoEn+XhJXHoiM1xnjiqeqWZZ06z7zMl6O5AtV?=
 =?windows-1250?Q?OdiXV37HBNOIakaVcQUn5yNljLd1LVTv+5AetrQLOIjz6TR9pc3KZACa?=
 =?windows-1250?Q?sGeQit6EicSRwbLrUleI3CDIKkvryE8sJdJbnB8lFlMr6yf8USCRDmDo?=
 =?windows-1250?Q?fzee1OxF5tyRyLUi+61K4XkO8Ujk9XxuvBRNfqRLaL4iSOwD5VLAb2BY?=
 =?windows-1250?Q?H+NNNbv7Z01QhPfxHJsBhVgCR6f7yY+gkPaAdDz3/Mx/Inw7wWagfN+5?=
 =?windows-1250?Q?x+0bLUCoL+t5HhUgzqLTVafIY0RidTxB2kDCGTk62jkVIqDoEFJ33ftg?=
 =?windows-1250?Q?bDqjmmDE6aS/yEvE7eDFIVbFF8Pcj/II2oc0sI5Kj8cQ9Ua0hvQLQEBY?=
 =?windows-1250?Q?KNmdUXSUnrcG/P+xZO/eRIHM3FT2pZZGshw/tk7oaxLPHLI21etapnih?=
 =?windows-1250?Q?MyH1PhKqIBflasVkj9Svfr1hrtRXraCyVDjb2VIeWxUk4MQEsVpgPY7D?=
 =?windows-1250?Q?7DCCx5UEvmjPIcwiIgcp+iua5Rqp7T9V3I1p68e9DA40EL1bUQxfd5o/?=
 =?windows-1250?Q?K4tpbseBVp9s6eiIhAhFgpbUPu2MMg/Jw6ZOAlCMgSskh8Tg+X4WDTom?=
 =?windows-1250?Q?sfKYNiClJ5G9XQ2GufQLp9nfzp66zCiG0BKAgJof6w8yMGsa2CR1xZpg?=
 =?windows-1250?Q?++6Atpnuw7G/+1Qpocb85d4uL5PQBo7JEyqBwI1Lfbg4SFxon10sjg1X?=
 =?windows-1250?Q?Rxac5eTTnQG9zMn5UHFly3QS0kPpOqtst9h1Szh5Rmy1bnDIC5xUeVSC?=
 =?windows-1250?Q?UPzvpzQ3JivhdJpJUrVe4MCj0ZQYJJf02vWfGz3WZ5emJaGqEPNuk4Ih?=
 =?windows-1250?Q?sS+bXRpjp/tPxhRI3RMq7rJHKzgcZ3z19siTOMCbA0afjOp094Z0UHvn?=
 =?windows-1250?Q?CUS55oS1OgIhd96z/9KPWxG8ZhF9zUEgzCPvDnCnya0fepA82CTFd/7/?=
 =?windows-1250?Q?rwQNtLdCQbv7AzahEE2DQc7aJMuwxKnud7Ww/sPfrU5C/G0o5cS21KEa?=
 =?windows-1250?Q?AdOhYwekq//mYbzNTonGsPZYNbkgtLZmLM2ba+ACfPhUvo4qMlKPlkYr?=
 =?windows-1250?Q?/3dsB13zu2AP+WkJ9B1SHjLgGgPznN2EYteldmErUDx/OQHBGIbavTon?=
 =?windows-1250?Q?eq0Dw7WsaGtzUcmIlSd1wS4GYmOAA2cN?=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o8mqq4PYnxJVjUQC+1FNiWI5lxuZP3Wljoj0pnYgWPtRyitF4Gu/3oe9bUUQnzl+YCuxaXDfMS830GkBzw9iKYHae6czUa1x43tJHW3y+MiE0im1WcUxS3Ssq16vdn10As4P09DIFocKdVVatAHnQPVX82lRnQxH4edxUpDhTux7DOE9ZkRDCsMT5YHY7pMdfsk9YJ/wu8263936sdo0Ym4KpXiYe7kC/ezwFFCjR6J/2vnRa3WoUaBeajFW9rACwfx5uBUoHTKEAokjvPP68hhVGWTfZAv3ECJVbsSdwwp8yJ0a7rGVDHWQ0oYPZgkPQBfDKe7Cw3LrKOILfDinusoWGRX+wy4oJuXQLFzm83odO2cfGKa6JySuP6Ivgvnk6Cx+0l8iUxyjDFjIwZ914+kmCIi8LcW/F7C4QY5st0vy8gaXw39dUeYBNV97SBjsKX5/VIQ79DdMRvCm2S68I2kYMnOvQsHLxa8nqO5YR+8BL5Zwk2nmU+voL7Tw9dTVyz4c8LRlFU/G4VK9osszbK6VuDMvLG0yNHHtCEu6Ob3UOddDzPmB+hLH7o1+zIWxOrRAv0KKMkzKujckO8ZvvrUiTBLO8UWY3Lv0pKePgnA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4675.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddfc6b5-4881-4d81-04b1-08dcd1a2801c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 14:11:44.3513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UHETF/+96lWlQ4AEEboOHTZnwbHINx9OMB08E3a0BD3tiwUccJo4AkLcMqyD2kox4GxFcUtgqvnPqxEIuZxOvod8h6fSk0mW7OwBZj0fcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_04,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409100105
X-Proofpoint-GUID: n7eGBKgl70nrr-rUvWcvBbUxbCpDE8_X
X-Proofpoint-ORIG-GUID: n7eGBKgl70nrr-rUvWcvBbUxbCpDE8_X

> This is all nice and good, but I would actually like to focus on realisti=
c=0A=
> targets (ie., ones which could be achieved significantly before 2038... :=
o)=0A=
=0A=
Right =97 there are distro releases shipping over the next few years which =
will still be deployed in production in 2038, so the clock is actually runn=
ing out fast for some of us :)=0A=
=0A=
-- =0A=
-- Todd Vierling, Oracle Linux Sustaining and Security <todd.vierling@oracl=
e.com>=0A=
