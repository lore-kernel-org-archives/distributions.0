Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902A41C30A
	for <distributions@lists.linux.dev>; Mon,  9 Mar 2026 21:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090577; cv=fail; b=PYls7JJnpiJ17LLiS7OypsdNKf0uULS4gIkGEc/vnweBc4ITpl6ijPrLTN/S8LYIV4AGiZrkOHOvGHN7FqbhvZhV5hvTQJe3ucg3z5GG1T9l41P4UUnwH2tSZGIIal7qlzBn7kOv58yO27tzrYqipY6zEQYdpKi72mc3afmyfy8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090577; c=relaxed/simple;
	bh=fgXiRlYiso9rdYW2jHCoEU7VcjXlblogkNqjMIyGgAM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hWQxNJuENLX78/bhVAy7FUbCKdpTAWpzMNpk5REvqytTb+k+RqK+7iLIcfshZ47hq7b+0+Y47KR7aduvgsz7+OrT910cZJwLOxltAiS44ZZLya9Uieia53fG6Ed0QskoP+XQFfc1Iy5WXsIFNB438bewy4vVLovI1wGpLtaVyBU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bTrtko5o; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bTrtko5o; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bTrtko5o";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bTrtko5o"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aPhQN4L1lSyDqVxhxjCu0bKZuc3w9BvNWa9D6BTXAg8i1xwz/hLacNTv1tGENbcLfWZ8/4KcE9zsPvTDEHp/l+TMFhq8tlKJaox3sXUzM1jxCqRogcQ0JXtNbwLDdVoaE8OQNqk9HM3N5lgMAdb3xtnAUA4mhVANgcUPqTaIEvvAsxdbtUybKJJD6yrghBaj2t/kpnYlfUXDtSbt9Tfljspg3/lZEpAZDsOAMEX7zf9sSjmawHVpkrDnhjHynABMQ/jAs/mEvvhqRIICPa5dg+Y8RKBYjPopNZAROzXLFos3q0aUIU6/AT2Q/tQwFzr50csOOEGixPj6qbV8sc4Yxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgXiRlYiso9rdYW2jHCoEU7VcjXlblogkNqjMIyGgAM=;
 b=PkDuC0v83KwIiNunHv9HV/a7Btx2amRrunUB3K8yk/pR/fpcxXRZXOkNeJ6ytoVJqosH34uOQ9IbW3FOLNg6LqAty9XMh295vUBX3/FCpmqwOXYYi/sgwGeDby+N1oP1uG/BUfSPMkTA1Pgjhe8qbcrdgVCUTGUlBidI7j2C3A93R9bj5tuiPf2ydX/mZKoT7z/l/GAqp7pvsf6cxqasttHiM8+aodDXfgJQbSKK3fwaQRfR71qnP+tOSPAcrUFswHgBZy426nErD0crozZtz+fOWbfVGoEetSuFEusYS9EJ4xfH///N6FV1EN5TrUzgw/ZoJHgpz8+Aq3GaBKPBUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=owlfolio.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgXiRlYiso9rdYW2jHCoEU7VcjXlblogkNqjMIyGgAM=;
 b=bTrtko5oavovgohRCaJ5T6Ouk8+mF638VuMB3V1o0g46rhp8VviezxGo9smMy0eyGFM+ZQ4ceTXZME+N+vNnUR2FqEAxDwIDchMEs2sa7Vp+gU8xxYU7myHnqUcrq4stx12unquRwvwx//ab7oxqHHjSDnbwiRt58gA991d9poc=
Received: from AM0PR02CA0132.eurprd02.prod.outlook.com (2603:10a6:20b:28c::29)
 by PAVPR08MB8822.eurprd08.prod.outlook.com (2603:10a6:102:2ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 21:09:24 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::7b) by AM0PR02CA0132.outlook.office365.com
 (2603:10a6:20b:28c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 21:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 21:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN3WqPnxl7o8OrlXTZ+007YYiEV4ToLSt7h0JrHognUivIZHFoWTorbyaY1pHXEF94sbGSGMlxyFygfIT+Q+IQQnYOiAd5+vg4+DozwLlwTeFVXlDuHpPc49Tvsc9AI5G1Tr2ur6/TKxAPj8lLdiUqVk+4EsXIaOveh+g6JNcsNzJCi0XP45JAA8FAWhi/5hXXx90KPYVgPGscgooBRE2mdvvPN2YLO4VZqaVpVZU957JXCjYDN+Nbn22zaFLTSyOocEFfQf1+MSlm4oCFjF0oWM0gX+5UUzIkrMifwEYyxBTyuvBSNHqRCAv3j+WqmwsKyqSnqUHi1N0Z6u92CYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgXiRlYiso9rdYW2jHCoEU7VcjXlblogkNqjMIyGgAM=;
 b=TYbKdasB8vxk4cJi5brEQVsxJIWfoRmVqSdfZBZTjl0SbbEn2/QgRG3Ef1W0KsBD+/e9gPJMWQ3SaOCWZSQOXoXha2H4Ku6HqDxXt8vD41ZhejbMVpaB0oQ8x12kpnTXkYHsBLRtt66eqiaZyyJwsEyS6VkaiVZwFuRG1SsdUB/RZPg/tJS2fpaumbnDUC2aKRu66EM98OB/QO57mG3Q35ifoYgJgLwpcDWAJhctIDyVx/CvB36JjGk1J0ZuJZ2Qnr+TZ79VmV3hXb9ekcytefZDd/+qlgBqdQE5atldWgneJj3zOj03qDbqHQApevzJRKo6qrDcFGISp5HaJYGvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgXiRlYiso9rdYW2jHCoEU7VcjXlblogkNqjMIyGgAM=;
 b=bTrtko5oavovgohRCaJ5T6Ouk8+mF638VuMB3V1o0g46rhp8VviezxGo9smMy0eyGFM+ZQ4ceTXZME+N+vNnUR2FqEAxDwIDchMEs2sa7Vp+gU8xxYU7myHnqUcrq4stx12unquRwvwx//ab7oxqHHjSDnbwiRt58gA991d9poc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7672.eurprd08.prod.outlook.com (2603:10a6:102:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 21:08:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 21:08:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Zack Weinberg <zack@owlfolio.org>
CC: Nick Bowler <nbowler@draconx.ca>, Autoconf <autoconf@gnu.org>,
	"platform-testers@gnu.org" <platform-testers@gnu.org>,
	"distributions@lists.linux.dev" <distributions@lists.linux.dev>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Thread-Topic: Please test autoreconf from zack/autoreconf-exclude branch
Thread-Index: AQHcqzIbglzek5p51E2IrPgfH3YLWbWfDTIAgAds1ACAABH3AIAAG4WAgAATw4A=
Date: Mon, 9 Mar 2026 21:08:19 +0000
Message-ID: <4DE85F69-688B-46B6-A653-2566E834300B@arm.com>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
 <eb9f5c99-4b8f-43c1-b527-60200265352c@app.fastmail.com>
 <k655rugxzjvt4tb5o3kc2zos6l7oz3ooqbfuw5j7yl2ls7miud@d7x637tpydpa>
 <692c7a78-3f09-4a2f-9e16-b52885245c54@app.fastmail.com>
In-Reply-To: <692c7a78-3f09-4a2f-9e16-b52885245c54@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PA4PR08MB7411:EE_|PAXPR08MB7672:EE_|AM3PEPF0000A79C:EE_|PAVPR08MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: d60f83ca-d3b9-48c5-e0fc-08de7e2023ad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 XFqT1cM1JDxZsih9Zmq+ZFtdO4b8W6RNrWOj0an2K7N3c4H4EJ83r6f8E6GzWabWR/5kqcemSoWQLcgZNQSaDzAgwo5BSONHlaFfBfWHp6lEhIQSunfGj16DjqVUNMk/pnWmqm9jxXTlogrn69aqFqLdExNuGyAqFOze2tp/RbP0BDKSrI4g9zymUgQp8eu2+4fbC9mrukSDHV85hJbgq2BP4dyVnB61TrvwjZdZb94yVfOZdkBaGP6tFgLsSVyV0vCY621ybUXT5Ig2RywLMPHOkC0dzFGHGFKLLJbXSvJDz2dyKGmMTi71lvqxRJzGP6UiaH43XyCX28Gb+Pu3ndKOwvQ0sYWzwj6rcKGB/5aa5yWv+MUlmeQhpZYQdmphdmGWX9c6kzVQWxaGlLM+ho3T5CCX5FbsLbPO9c02EPbejK+PQ5Xlk7VJF2AVUBELmEFmw5l/H3/B3dP8Bt2D2ov5fCkHkOSXw6t6LNS/bZiCCvK2cagLLksTgiKETXBOawmaz7OswYFG46JWlY7Xys7sYIE7Eo9XzSAmW8F2Nwwm2z60dmR21K0PrRcSMxnNA40vPa3Ze3T14rkYPvLmkiqpSC88Ki9VeLnCs1S2Yey0AQzWVls33rSah6hQjAiOwPHPkMLJoTg6SnsRFNBdYzntaOK2XBQaOpQVsSkSQZle4/XClDzlUFdfZ7f+Z7aFUFyVNjKVAlv6pOXcmW0aPPKkQgg6ntvqPT3XM9wMRgzMAoAmUyi3rZaOWacH5rKhrWPh5+mrDLBzCeXpJkyK2zwzMBJ1vTvjQHUTMdcHDaU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <25C0E8E0F975E543A8F53BC550647FC7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 TAiQ/16OwWdKnXok+Ip5/Mjy6zdd+FmE+JEX1wDx5zZRLxRvFcTYFQSXxHsqEemw9UJCqDWpuVxN/SATAcMVE7EkEjN4AR9UACAmEAYGyGpCiXgUbvJDtAKHB1M9VtX77ZsaZ/NRCfaAkvaaaSXlNC9/VxxmpPpQQ/asvkoLY8QgrP7BOZvvUzfV+tKb8+lWFnnY1uGz5CT2boFsnhoJH8N5qWu1W1shppJa/lKh8Qu5zHm6gCyi+xyjj1LLaeO7Iq5n9ugg2Y4W1sfOpMpovqlqBhrfFjIeFDllt6VifYAPpjdGNLz1i+6wFwddN68v9ttOqDmqez2CwhQQEwCzjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7672
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85304dc9-c76f-4de4-48cb-08de7e1ffd8c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|36860700016|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	R1tQ5DiLA+p9LznB6vDxcIvHjqvfPblzzdYUjL4S3v+UP9PofAgw/lKtmitrbCQQc5zJQ/oYmDkngIlr9jMAxs1rekbVtXQ/M+S1mubYOek/v/LdHgIP1kJSz5yOGBm88LQRQwx2OyyGOgD+e9YTt3Vae8o/DOHf8Yzv80EJ7s+Iq5dg2r7oy9hA1gJ9D/dIYnkFe1Jj7/QYDTRehyzQuz9imEWil2P1Lol5tzozIHOnS8KNyt8piYZ5CEKPXu5jVnx9/n7/ZQYcxwUF0+s6SAUMHF+fv4UTP/SN+/dCbwl3RUI54kya5TEH60c8Y1tVEPmmOH3AzPunFisvlrygv30UyLWiFGFOUw0nmalq0V5qcXL3xTUM5+5HgdnC69rQdnlNRvW00hGH1q1FgVRlA5uZDrbc9BNa9GtSNNHBI3YNPzBO+rjC+4X2RMJ6NBuhU2WCbYCI6axb99ioE5XCSwhsnPQzAVN3vyFGF31OOeXGl6HyiHPGt5gPGatLpBxDg3PQR1xYYkqtyT+SBTO6TMErMlOUDQsH4F9MqEDVRwD6uoWlVurc8i0gugRYCy+KwA2parr41mfGmJcCGyMWiJOqknEvFU3MM6+BbupeSBIuWNm3peiispjjpJVYijEkhJocFR/s4D0ZSVKC83KBZZAaQO4MgpZbHZ9o8akuaGtuViqYksx0zaIrePy30JTfGFhpuvZK4wHLo87vrWhOo1czTeX6Z5u10CqfeDy7w8md5VNs838zx+kaVLLtTUzv5Gig7DbTRC0RmUOiGnEa+A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700016)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8RpMBD2n642VZdim8l7XfmGqg+D4XP0fD6V3Jx+azlp51pM6mzmgy7/8eYm6Dp0J1xZktZz8NLyFrCBEkxHq0m2szG/BtfBr9guB+01HO/TjiPzv6kqZtNcKa4L6KjLrS8hu80yc1SsyK7Qk2dVW7us8m9FMsIiJQ0GJLJuTbiQC622oK8ZY7VqpfiUvTFrwTTtAlw3Gl4V+xhbceJP8Yr1FbNPeN964EjOZvmSR8qLEB56+LV4m+d9qYNdLJrw6EAnUjJHubwZWGKNShdq+skW5SDpru5M79sUK+iPHBUG/T80Appu0EL3wzoXKI37xa3XJEV/kAbKbO+ie2QhIMkMY1NTVq1tt00qjSpweRobjl6FhmL8Ue9dKqg7O0YUAe6SbXqPvH+V1SzSs42/+8cFISULKDbsg5xk5VJYTbZ+y2hEjoprhBw8wTgyIHiBY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:09:23.4933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60f83ca-d3b9-48c5-e0fc-08de7e2023ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8822

T24gOSBNYXIgMjAyNiwgYXQgMTk6NTcsIFphY2sgV2VpbmJlcmcgPHphY2tAb3dsZm9saW8ub3Jn
PiB3cm90ZToNCj4gSSBkaWRu4oCZdCBpbnZlbnQgdGhlIC0tZXhjbHVkZSBvcHRpb247IE9wZW5F
bWJlZGRlZCBoYXMgYmVlbiBjYXJyeWluZyBhDQo+IHBhdGNoIGZvciBpdCBmb3Igc2V2ZXJhbCB5
ZWFycy4gIEnigJlkIGxpa2UgdG8gYXNrIHRoZSBvcmlnaW5hbCBhdXRob3INCj4gb2YgdGhhdCBw
YXRjaCB0byBjaGltZSBpbiBhdCB0aGlzIHBvaW50LiAgUm9zcywgY2FuIHlvdSByZW1lbWJlciB3
aHkNCj4geW91IG9yaWdpbmFsbHkgd3JvdGUgdGhpcyBwYXRjaD8gIEluIHBhcnRpY3VsYXIsIGRv
IHlvdSByZW1lbWJlciBpZg0KPiB5b3Uga25ldyB0aGF0IG11Y2ggdGhlIHNhbWUgZWZmZWN0IGNv
dWxkIGJlIGhhZCBieSBzZXR0aW5nIGUuZy4NCj4gQVVUT1BPSU5UPXRydWUgaW4gdGhlIGVudmly
b25tZW50PyAgQW5kLCBpZiB5b3UgZGlkIGtub3cgdGhhdCwgZG8geW91DQo+IHJlbWVtYmVyIHdo
eSB0aGF0IGFwcHJvYWNoIGRpZG7igJl0IHdvcmsgZm9yIE9FPw0KDQpJIGRvbuKAmXQgYmVsaWV2
ZSBJIHdyb3RlIGl0LCBJIGNhbiB0cmFjZSBpdCBiYWNrIGluIHZjcyBoaXN0b3J5IHRvIDIwMDUg
d2hlbiBpdCB3YXMgaW1wb3J0ZWQgaW50byBhIGdpdCByZXBvc2l0b3J5IGZyb20gYSBiaXRrZWVw
ZXIgd2hlcmUgaGlzdG9yeSBiZWNvbWVzIG11cmt5LiAgRm9yIGV4YW1wbGUsIHRoZSBtaWdyYXRl
ZCBoaXN0b3J5IGRvZXMgd2VpcmQgdGhpbmdzOg0KDQpyZW5hbWUgZnJvbSBhYWxpYi9hYWxpYl8x
LjRyYzUuYmINCnJlbmFtZSB0byBwYWNrYWdlcy9hdXRvY29uZi9hdXRvY29uZi0yLjU5L2F1dG9y
ZWNvbmYtZXhjbHVkZS5wYXRjaA0KDQpZZWFoLCBJIGRvdWJ0IHRoYXTigJlzIHdoYXQgaGFwcGVu
ZWQuDQoNCk15IGh1bmNoIGlzIHRoYXQgdGhlIG5vbi10cml2aWFsIGxvZ2ljIGFyb3VuZCBydW5u
aW5nIGFjbG9jYWwgbWVhbnQganVzdCBzZXR0aW5nIEFDTE9DQUw9dHJ1ZSBkaWRu4oCZdCBxdWl0
ZSBkbyBlbm91Z2gsIGJ1dCB3ZeKAmXJlIG5vdyBvZmZpY2lhbGx5IEJlZm9yZSBNeSBUaW1lLCBz
b3JyeS4NCg0KUm9zcw0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1h
aWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBw
cml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29u
dGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3Rv
cmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
