Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533033624A3
	for <distributions@lists.linux.dev>; Tue,  3 Mar 2026 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772568369; cv=fail; b=Id83Yiv8Va0TDPF5fOaoD+lbkbj7TiaksJdsYvyciko7KtyG1OUhqy27RxNwMCe9mvPBJ1uTIsJPdOn4CqYpr5FlHw8Oqe2khTGIVjQyPq72+wORy/x+Lcwl8iR/YSgAMamd67aDCgCdMNqoF5yXpsM9VTFa30GdGWke9Vz89Vo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772568369; c=relaxed/simple;
	bh=vDMmKoNd6hPgQJb938yNteyqbVasE4Mhkv2Y1szslpQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O+8/YEOZr4YQcPIItwil3CswGuFKsWpWCOxm0mtM6sroFSl+kbGBKo7aP4T/6IrvWE4yqzh3SofVCeli2HGQ1BlTEmXpxdKeHrdl1UD3JhE6VZBQwbtEUTKtqH08mhJcu+h+fhZQJf8oIF+4vElAwODwvJo3gzhg1y//29V/5+g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DrfPMZzW; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DrfPMZzW; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DrfPMZzW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DrfPMZzW"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x4AhU8W+Dsb4B411nEfqncaa5lXXnaC7urJojVAQYYOcqI+Sf88yk9dHTj7OAJ+drNgnElmgMPIKB3qe7b6UnoRtGd6/9a/GwVnCYUKdTP4tYu3jeGiIGnBLQLNVQMGPr1ipzpWmIKX2MzlatdTy7QzfexJHAuwaS6/0t7s+Rv5pTi5gbDYTDTGG7Dt7cXLG7t7C71C5hUfiTRSXmMfXZXPd7gxhytHT7MXVfyLTWCi6s41ZrlaOGV2yrMXS63RUuQ9dmJRYKQyjuhchBmuFrVz3n+qjS7i6unmVN2BFY2SOdGqhHUA1h140IIAGnQuSrT5AMdqNe4yAtTslZNdj8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDMmKoNd6hPgQJb938yNteyqbVasE4Mhkv2Y1szslpQ=;
 b=k9xglEVf33fH2weuJmY5TGPpEvP6Xa/NGKtpHesnh0kjZcPVxZU9QO8o/6ffCOWK42me2BY+xD2YtE4zvNSpTu6ZsCcfNl5HbVURi7bnD6u+9E6565fVbLHMxW4F4F+R4alSfmhgRTnr9wmxH8usRx1OvbwWrzVaaih6ak/5SoMTUK+fBrbVJlcChE2gkQXdNBX3jx00s84A3/FJbsBZE8QHeBVslEGFhU5WxrnUcvA7HWO+CSnFbAiBCbFc3ODdYGy0PMPdJMvHGhHJpLVFVVG5tVAkbqi99WwmnbxvVLMG0nfWbRFRsKVWUZ3cJ/dJKmDKuAiv/1MdkaxYBAGc/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=owlfolio.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDMmKoNd6hPgQJb938yNteyqbVasE4Mhkv2Y1szslpQ=;
 b=DrfPMZzWxt2c5yvAjSLZ6cMRxPY7Ct29Rb96wW5YS9qIIFPzG6ehLPwduPaAmOfP93JPpqf0l1UhAGuRaMjB/K8QQBk4291t6se+ptXlmhwAJOEV+C1c6D9JKD5UcwDzQ+32pr4b2wGne5QOPziDy0NT7k0DPXvreAnA5j2ydJU=
Received: from DUZPR01CA0285.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::23) by VI1PR08MB10198.eurprd08.prod.outlook.com
 (2603:10a6:800:1be::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:05:57 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::38) by DUZPR01CA0285.outlook.office365.com
 (2603:10a6:10:4b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 20:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 20:05:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqIWa0+yQX9a9i47jpDyEfZbJrMQ0AzAFHzHEebg6j6YEkrDrBGybahzbT9By0HnFuFRsPbQxyIFdYmY+FElVaySJaX0kHWvwFkxue3x+8rFpQrSkJpYtwCyEaVqhDIWvuG9r6vcS0BVdA+N0UFrgEU0mUEinsyOrb4++eA3pRkjUM48WiKIGLu8mrpgYN6wrQbpf/b/EqlCKgs8+7LHdrjMS6Jriu14ZTLJtP9j7Yqr3XAVlppn5/LpsT0NyXW1jkO0ldNe5jQOGLdGsguLFIbh7Zhs6Y7AggHSX4PSseAlsP5MJP2998fMvJD8QtcqfuwMGUpyKLMZeO5iakmoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDMmKoNd6hPgQJb938yNteyqbVasE4Mhkv2Y1szslpQ=;
 b=xDu+ovvEqVWYtijwRHoo0Wd3hmKK0n6cXxhrlxyJFeaW3wzxruirYevQRMDDRCpVNWZ+VzCjVbSa8tuYyE6l9XjdxYiir6GtrBAyxOzHaOUxEgu+jM1g+5PewI/2kXMcUvlvbPZX5kAl3EBhlLUQYO8Ed2ILy1xK5SMWpSE9Wx3P1x3MQHsjwXFGmy+pUqZkeTYQm68rds0Rtp++6YLwVBSZcJgZH3XJstQzkAlelWk/dxD5faFs+AkIFlEowYdNVXygHhIenQJ1jl4dKNRDLT+s1u+fjsmUnAKvHcwoyuKCWyAIi3rxEi8JTZtF+n6gD0ezPZGK+9dWWFNmARI20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDMmKoNd6hPgQJb938yNteyqbVasE4Mhkv2Y1szslpQ=;
 b=DrfPMZzWxt2c5yvAjSLZ6cMRxPY7Ct29Rb96wW5YS9qIIFPzG6ehLPwduPaAmOfP93JPpqf0l1UhAGuRaMjB/K8QQBk4291t6se+ptXlmhwAJOEV+C1c6D9JKD5UcwDzQ+32pr4b2wGne5QOPziDy0NT7k0DPXvreAnA5j2ydJU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU4PR08MB11745.eurprd08.prod.outlook.com (2603:10a6:10:644::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:04:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:04:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Zack Weinberg <zack@owlfolio.org>
CC: Autoconf <autoconf@gnu.org>, "platform-testers@gnu.org"
	<platform-testers@gnu.org>, "distributions@lists.linux.dev"
	<distributions@lists.linux.dev>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Thread-Topic: Please test autoreconf from zack/autoreconf-exclude branch
Thread-Index: AQHcqzIbglzek5p51E2IrPgfH3YLWbWdO4+A
Date: Tue, 3 Mar 2026 20:04:53 +0000
Message-ID: <A3D0DC01-DD2E-46DC-BC40-2E40FC60E9DC@arm.com>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
In-Reply-To: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PA4PR08MB7411:EE_|DU4PR08MB11745:EE_|DB3PEPF0000885C:EE_|VI1PR08MB10198:EE_
X-MS-Office365-Filtering-Correlation-Id: 579dbd3d-c26e-48a4-29f9-08de796047b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 QIP2J2GVuGdARp0Xul4FO8rIODenM1lFyrBPuNy31/UAn4Omy5EW1XJWR/tncpjhc48uSeNRTWRv/8vDoYz/s63rGVx2/8ucQWhha5E5faYXtYBRcxGhPxOcGxWfCb0WNRIoIi9Jaq0sFuYAD8OnAUPQJDi6r96nrDzYfOa7TCXaSkEn37GCHDB2und0ioyqK1SA0bqQJjEN8siTwwa1CAawz8PMqKHaHf6kfWOVUw8bgZgAILbpYONuYwhVno72vL90NGenX75tB1pKbfzJ0P6jbi6DDCrE4H6swWBDSFqVGjmmcf9Db9zWOApXgXjz1XqZ/5jiU7rQDvkHcNm+L9KPIxGQ0MUAGlVm1Npcx+VOPG1bi7zGBLF+Ty0a7z471quPSIZtwMR5nqLvdrFO1KkgXoJOVRLf93BLsznTq1w6CHbgwumnorAVsKr6oWBq3fuN9FUjDffVrdtWgRT+HHHv5EcLTiBpjWodAva2cXYYK9rqpYBjTYl888CUDpyX7ixCvlqTZ8he7T4u8gYcijScf/lIF1JzRE/fHVEDQenyBZNjSLIid0MJXP1Qyjt+bJ2yWOBZlT9EflkKYH+W4huZCVoF47qTebbwFuMoNnCd1JD/jtiDMRog+6GaEOcqO+pyBVO2O0qxikLrqTMHKOIIluvw457gVhrk6PsvgL0Jm5LAdkQZw4jRQ1npANX3w3XJcH7FD5wMibOW4dLBIckw1LR48WFjBPHownPJ59bUXo6BTQCYDk/7Yab5+T3o+KRSR4Y3E0c0FZlP3LWOTKoyIgsZzj/PkKb/61RYa6s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A06685E47766F47AA0176020BCBBBDA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uMYC3mmJrm5t+MUwZXvdy1GokO6sFHWKNCq6woClvxGqSOxYEB4GlRPQx3bwQJA2gMy4pc+mPc8DOkt/aL16Yx8KRMbKi0EWYfSUTwzDnVMiKYLPNUkWk9EzKZQKPodJX/xFxT9iasQ7JES4Kr4eYngBDcgByNW6R4jcOQaZEtCTKmcLoOEy3Bqj3S0cc3x/ETocIiRqROXMGnEXmjT5RjEXBrWFDvYBdYlqDXDpsiDDz2MbWxji+GcEFqWfDRGiYeYFUMl9CDJyrXx7F2DcY2uIBBPjKPNzt0y+fo34M6RR1mrkS4Beq7Tq76wr5qihDjW1Cgn/Vo0eDmV1mlMG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11745
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc5f0766-c48c-41c5-79c5-08de796022c3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	K/WvRVlypBsIgWq1p3FmNxRkFnXP+f69dFTrkdWlUSsaDYYbPHK4zcZCE9NvRlBGvkzAWpnbdRBWBKc6T5urrEqf1U4SNCEh/RyjKEoZ0tk6WVv/uKfZlCSwmVBTkCbBViVXDcc/ONFKbpDMbl7NH/QIVEAao1PUDg8OUs2vtdJO9rJhMZ/naJTy6w4slh+1iAxRwe70eDJiGFWZ9wtjAmLpwfHQB7l/ApizHX3dWW0OzpwCEh7ZtyS3sE/6vSVYR7oQ2QjeonALP0WabiHhXF+JudA5l/qGDIrT8TlQXH9xbccIj6ZKGngxRQArz55Jns3kFGFrf5Z0pdtLIKC1zQxMuT2O+L7p0fDIB2C3mNiREW16O0RjokcI3uK9hktXJQLeZp2YFWQNkP3BYjwj71xXWPkWDsNOySaVzUeSqbjuThu5/3+fJ2NO0zVBUZjd0G/iCmpeQCjj8LdCpX+iq70ANB6a7BOINlkOxt5ze4rTNulIxIavapjD21j9MHSJ53iRCCd+lyCkSbNugDTSYvuEz1aOyFNz7/kC5mfACHga5I/wU5bk3Y59JbtKiVmmJyWBaadqCJQSCs4ComOyhaMyxK2rjGcAqcE6HgYYPkA5UV3DZ9dpwba3LvMpBmb+gL2UwMsjze+VJpTCpq2q8Ggj+R48HF+CoJxcxbifwTDf96EC0pse5PiWOr9l9Vf8Dbh0RlJvf/aejV5wTPAtN+pm0c29OXppMtZU1NpwSFeC5IldFUMaG8hoC9q9UlQFj8Mi5jhu+YJNcWgQkycR+vketDlTCAXIICqUkQ+tv5hLBPHwJX/bb6RYovNTFkvC
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lP7V+WRVOZPxBotXcbr+Fh2CSCxYc+VV7XcW7TaJgg1wd00SDHfMevisf66NGb2wDPUlpb0wpjrgxsontONzimATKyV/2ogdsHaSOjDid2JmBB2M27uYSynAm3tiUK5+leAuN8+wWfIth4NTMH2Rc+DWK8ZCsjcNyxjquXkm86t+SXPJiLRjMKz3KGLIzr4qckLoqZFEtoqmqPfj9SJ5a2jXdCpDP0nE7SSbyE7inQnC2UOesQaSXripJ0Ig/Jb2D+mYo34vGUUzV9WoKZxgkU0gipav9SD0irW2oypvy92sAoD3tpfCldCoR1VGq6FkUiOnTMfLZA3ZD9WIXhR8frL5dprqXY4jWzfnVMMYlVPyDBuj76F5OMapAG1ynSnV6RgH3UoFlJRaOdCVF1DtEjA0ZXNEpRnVYgSu/2Pm7K62G+FNEgVG8C4lV6bXnO3/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:05:55.8826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 579dbd3d-c26e-48a4-29f9-08de796047b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10198

T24gMyBNYXIgMjAyNiwgYXQgMTc6MjAsIFphY2sgV2VpbmJlcmcgPHphY2tAb3dsZm9saW8ub3Jn
PiB3cm90ZToNCj4gUGxlYXNlIHRlc3QgdGhpcyBicmFuY2gncyAnYXV0b3JlY29uZicgb24geW91
ciBmYXZvcml0ZSBwYWNrYWdlcy4NCj4gVGVzdGluZyB3aXRoIHBhY2thZ2VzIHRoYXQgdXNlIEdl
dHRleHQsIEludGx0b29sLCBhbmQvb3IgZ3RrLWRvYw0KPiBpcyBlc3BlY2lhbGx5IGhlbHBmdWwu
ICBJZiB5b3UgbGlrZSwgZXhwZXJpbWVudCB3aXRoIHRoZSBuZXcNCj4gLS1leGNsdWRlIG9wdGlv
bi4NCg0KSeKAmXZlIHNvIGZhciBidWlsdCBtb3N0IG9mIG9wZW5lbWJlZGRlZC1jb3JlICh3aGlj
aCwgSSBhZG1pdCwgaXMgcHJldHR5IHNtYWxsKSB3aXRoIHRoZXNlIHBhdGNoZXMgYW5kIHRoZXkg
d29ya2VkLiAgSSB3aWxsIGZpcmUgbW9yZSBidWlsZHMgc2hvcnRseS4NCg0KV2VsbCwgb3VyIGdu
dXRscyBidWlsZCBpcyBicmVha2luZyBmb3IgcmVhc29ucyBJIGRvbuKAmXQgdW5kZXJzdGFuZCwg
YnV0IHRoYXTigJlzIDIuNzMtc3BlY2lmaWMgYW5kIEkgaG9wZSB0byByb290LWNhdXNlIHRoYXQg
dG9tb3Jyb3cganVzdCBpbiBjYXNlIGl04oCZcyBhbiBhdXRvY29uZiBwcm9ibGVtIGFuZCBub3Qg
b3VyIGdudXRscyBjaGFuZ2VzIGludGVyYWN0aW5nIGJhZGx5Lg0KDQpSb3NzDQpJTVBPUlRBTlQg
Tk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFy
ZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlh
dGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29u
LCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlv
biBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
