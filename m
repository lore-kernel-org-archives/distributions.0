Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AE34CFB2
	for <distributions@lists.linux.dev>; Wed,  4 Mar 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772655628; cv=fail; b=GHet8mbPTIw2060Wnws7hIq7Z7tYb9EtV6hWm+qHyIt5pH/MzvEYyVGQTvelP79x8lIUTfnyAWuHv7GICWpJegMmVBqwZzwbV9YH0zqJ1ED26YkNdqHhL7FCcakKDNGvCpmWPI4hyifMwTe6YZJkguzSX+eXhTLt4Ro0s6le/2o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772655628; c=relaxed/simple;
	bh=y3F0w+Ej7HMcP/On6BLiOBMH6BlxbB3x7OJ5Fg+zpUE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bdDKUitE3Zh3nfeOUAfy9atVQA/Hn4yQ8z83jDr56xwitm1EEiaD7mJ8V+H2EAg7Y7LMJwJHXtikiBBGui37o9pO4soVIVplKoHF3oM9nuTa6r6JZOI23b1ED6IAuruKyoW0rfVDCMfCNctpd7541OWtks3dojmlZbzYs+yy//0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PtHB66il; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PtHB66il; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PtHB66il";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PtHB66il"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oLbPtr3szZWcgpdKfob3frDtrRUpGluSE/Tx4CX2Oo/k9onVYEGupA2VyHHJz9cP9Od6NMw0/JIVPvgOpl21+uj+A2u8NJNrirjo/adx/dFKFdgAbHaGWQd+qxH3rrpka//32jIe52WwnU2CYKo3RKEE6aPhiKge27K45eCu4KSfI6BAPSUrt73bgWHLpY82urEITQzOeMts6uqP1m2Rw2YKrdYzye/WYqIcspXF8XnyAKBikTQ/eIuKog1gaUsrY+SkzdcAg80boeEeQd9oXK38NBQaBP2P4BNgqFwavzHN0YXHE5D9G87vrxDFJeJAfSoLhjftlOPs89Zp2i9vbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3F0w+Ej7HMcP/On6BLiOBMH6BlxbB3x7OJ5Fg+zpUE=;
 b=iF/CYx7rN3dgKDjVDOOQ6BeH27ubhtSTX/39zVe4TVpwJNbP817IpTis6523Dx31jjIgHSw71kO3cUAebRpjyOdPvCWDUjPcCr5L6gpYMmraqSjjAzR8IUyCodxzXhMUmR601fgsvrFSeNxRPi+xpbTlzDHM98PZNpD7x3JLaosRMeIZDW9mbRrOlJO1WOvc4C1z3OGiyp3Ka7UNHmBUGUTAXer46EJA89xypZAhwpeEPRJcy6QZcr6k41o2O+gD03BLpdXuouiJf+uQZzAhJURZYPQq2nElziDkD+/dy7F7O83x2sdbQx9EexRLJ77QO7/ZHQh4hi1PHGJDn5ljfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=owlfolio.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3F0w+Ej7HMcP/On6BLiOBMH6BlxbB3x7OJ5Fg+zpUE=;
 b=PtHB66ilvpesbfRWWo1SgfCejnZ41h8grwNzB3t302Ta2uPjPfCnsGVlEfZvzc0ekGBJAFt7zr9Q0PzSTLc6FO8G7gNNG7F/9cwN+2Z2QdSDkdQ26u+H8X5bC/OOiVZQAKSWtPGSQz0ob96h9sXGgD6barTmcRdzF1SQmf/gv4c=
Received: from DUZPR01CA0204.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::25) by DU0PR08MB8067.eurprd08.prod.outlook.com
 (2603:10a6:10:3ea::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:20:21 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::b2) by DUZPR01CA0204.outlook.office365.com
 (2603:10a6:10:4b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 20:20:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Wed, 4 Mar 2026 20:20:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkuIgkIh5Gb67XghDzqwXpy+JS5BQ4CDySLhgF3igudJDezWuriU6l8m1jg3h4j8JDqL3N78341ssWQxsc8FV4L8KUpS+NsgjPQpu2mS+GrOF8I4pEJnO/XxegcNZ5tfBgkBitREup7ocFDsZyf406895cTdX85fi0iY5KOn8uCmqHx577MAnQN+kHoo859oEDafMH0+EW2230gLFcdau990Aa0iSTFwTkDwOJbaQiJeWxgtuWJbvfagN7/tJNMYlryspF2Q1O4kGoZcvWLJtN2umtQrAPjEsmCG7XwIGOFBZ9yQSaAQU+e2u9JBREfs9LhcDInen6IBpBjl1ixIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3F0w+Ej7HMcP/On6BLiOBMH6BlxbB3x7OJ5Fg+zpUE=;
 b=ohcx7GZTfhR7gUd60ddadWx/F/D3JMQ/Ma8R1X4zqkSXbF9gjUflqcRgd6YtA2Z7Qg0T3wD5hQUZrt7Eynlixeprj7F0c6Zi2aprncrgUE3y1MutW32vYdIEE2H9AF2qA/hvUPcd08biERKh6w2vXCD2ApWT9GNoSFmALOuJdoKdnHUbhwz5p8gxK+5mdqxK1aqA5XRnu3+5cWbGWH0hJb7eqssdDRnvQ/i0XWibb8uPpKsVHA3kq+4EAeAUTr1sCs/KrnGIds9QpoQgJcLX5tIBfn0ac9fMqcyJdhmRT5T/Giggy/hZg10vCXlyVoECyoJtRIfgb95G0EugSD7LNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3F0w+Ej7HMcP/On6BLiOBMH6BlxbB3x7OJ5Fg+zpUE=;
 b=PtHB66ilvpesbfRWWo1SgfCejnZ41h8grwNzB3t302Ta2uPjPfCnsGVlEfZvzc0ekGBJAFt7zr9Q0PzSTLc6FO8G7gNNG7F/9cwN+2Z2QdSDkdQ26u+H8X5bC/OOiVZQAKSWtPGSQz0ob96h9sXGgD6barTmcRdzF1SQmf/gv4c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9105.eurprd08.prod.outlook.com (2603:10a6:10:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 20:19:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 20:19:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Zack Weinberg <zack@owlfolio.org>
CC: Autoconf <autoconf@gnu.org>, "platform-testers@gnu.org"
	<platform-testers@gnu.org>, "distributions@lists.linux.dev"
	<distributions@lists.linux.dev>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Thread-Topic: Please test autoreconf from zack/autoreconf-exclude branch
Thread-Index: AQHcqzIbglzek5p51E2IrPgfH3YLWbWe0egA
Date: Wed, 4 Mar 2026 20:19:17 +0000
Message-ID: <2C4639AD-A962-4113-86DF-427761B1B267@arm.com>
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
	PA4PR08MB7411:EE_|DU0PR08MB9105:EE_|DU2PEPF00028CFC:EE_|DU0PR08MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a8cb7f-c7da-4e4c-7407-08de7a2b760c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 FUMi9whGAiAnrevoPpthjCz7siEpq6ckOD1ZFn1Nle1uThU1onic4LqR1ssSgdn4+q+riS+VZ4BSAcqhINkLcOZUtk/aar3FPduBUEjDLEZfY7YuDIQZpUWj98FHhHwAmU/d+SM55ysfgaPcYolygkJYr+hN8yg1O5Q7YX+LaKHjO+yuzZyOJ0BpeVIHIlg17g35txfEZXIz63Z5nJj5RcrxY8/aJSjAybMxaTcwdw0/rj/F92EpwAYFmYsazFWNwi2DZQXnjKTXAoW6/or/Gca22+z0l39fFaXl+HcCXGM5F96+Ax/pblJjeBMNaxEXRSenaRN2TRjT0b96fT9vxpeFfboRJfMaB1PauIKmksaMhnN8t9FP6Av+HqiSXllb2lCy8CSzyA+cMzCZ2D2gqHWMQis/eiaUg10mXBzkbMwrHHIrFsZtaHqhNG1GY4QcYNoz+OKE3B8w/QB7JdDLLkNiemcszsXnKDasTf1UFN++EZKQzr3Yp4Ry9huqLFYvoOhDtbjDH9JS7cmQRlDbVisdrBovyZv49zgUgBm3bD+I0dn3tCKNBO/PmFKkjd5RATeSnNe+TaPEimPgv4WclSKJttV4sMkVGEvGR5HBJIOXf8+41c3qNWiTZehVEPL4oySOULV3JXLgbL/TmE2ciVppZeRN/pYKGpe+ZFMWDficyIreXNqd+pkf2d0uuUFDE9o3tF5G82QTcW15pVzwdUKqlrC4m/qFjs0KUdMnspBCBOzbT+zaLXdJvMJOX+f9OqxH/09Nqn3x3rc6rG500JlQtWgRgfGyXMBpejeJlYw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B8A631B836A664ABCA55528368FEE73@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 t/Fg9dsxSg+Eg5A3lYqbNbZPYDuYzwz7bij2RKJWy+KGnNJCuQCJ7836rcvigjyc+7f3b81yrOjgPOSCh02L8+3Xnr4jFUFpYtZfjISJMYgGS6fPuXibh9HT5jzgyKWuxdD4GTZ/NBhpUWiVr4mj/BCrXeOInlXJyEks3IFJYQr0uxZGN2IzL1SWSNLVaSy7u550ucDYyfEVCr26qFeJBxz6GqVDUX4Z7paB2gRfH2ZNCsjZvvxt6hwzPvDIzFqkakLcj+hsqTXdsorCICDcxhb1zIR29/6FOtDENfpF2oYV4/I0IQkPW+2j4sgYvU7nJxAeTwa5MGSobUxDdZtNTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9105
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08b18b9e-5d7c-4293-0748-08de7a2b4fae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|82310400026|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	qcGJz/tSsKQnXVCI4ssRBe4W5Xp0DeqqwnaCmNcwsaDe9JZ6Nn+1lhKLTKp7G7EulUNi3LkatRIIhcWrlwc6er2VMVtvi3Z6PywFw/CyPnKiyol3cvf/kb/xsbGuRs1GtNrpDGbyja194A0cRtDyp8HGXSmnVqQXfu2ORMZmbTuvCUjWdeqd4MN3iDxfELgCDZqWaCjI2KcAbkcZ3R/pIcNh3bOwsQdCDGiKcfGjPV3Q/HefhVDO1SiwDGyaHJ/zAj0wgsTRPoKh3fNrhDZqBH2YpzrkmLrfAFG4xUxKGauTN0aauZbhNoJCZfsf9sh6WcfgzsdoMq7mVTrHxUTDpPAnZdRODiMT4lB8dwAXdgBar9JVmJ2ZpQsyLhS6CWfNLa2oBCaa46HYUJanJl5yUM1HIp8LO5kMOVFhcKkSmTmvfIaFhHVG8AqmPmSiTEVw3A8DWal5Jr/BG0EFCutTNZh36uPGLwYJUMuc54c1dLhbma07fcrYlY36yespStQTxoiiDZMHjFC1C+B8h65eRoRAxW60C30BkMqlLmHyUH0v0xfdVl3/PldprNgLUkqJbQ3zWdcVjqsh9/4WNQyBiFIA3B3QBsfCU2cjNLFRI71kB22gMze4lQET5ec6wvrFav3DN88oYyXC7hCa5a8Aw4qrG0MkueAEfQzyfA2phLFUTw7UHH5boFV1QOf1EqexMCOo61lsMcSCs9lMImilKeQ+oV+MyBI5/9c5EnHsXBK1cMmxM+2DDeDeF0r9strcfQHy/jenwF6QI3Pen7wdgA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(82310400026)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f4Pen792keLiMs5F+87cbykmbHM7PpXbyaiZFTKXH3lDXNjiJC8HYCq1nI7EJDUYDmpavdx8p1p6yHPS610UNpgMTU+npwNdntyis2c7/vUY5/7mvCDdta4lt6b3NT9rUa4icGF/nnwyXnOO3DAdPGQO5+psvZbCvf8yVc/yrsLzjjBRYUfaGnb7stybd7Nd/ZlMC5wrJegLFrEPgLzfmzcmqg/54IYX4jMF1LkFiFzncxDq62cwVsB4J5AcUjNY5+D+0dlYjRZ0jq0afXWMJf6lDqmDAVi6hJY66S9iCRloRMtIMSMDGe+zrxWy2ULzMxGsFWQD9K7tJkbi2srqXPYk144XC264zZRfB+Ih+Lf27bPS19IOXbbhoHZfFaHc8W3PYqG8tyzDP3EGCjS1mbhoXxx/DXiTwTWocfT+EMBwVBvZfVwVrMJzrEyE038u
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:20:21.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a8cb7f-c7da-4e4c-7407-08de7a2b760c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8067

T24gMyBNYXIgMjAyNiwgYXQgMTc6MjAsIFphY2sgV2VpbmJlcmcgPHphY2tAb3dsZm9saW8ub3Jn
PiB3cm90ZToNCj4gUGxlYXNlIHRlc3QgdGhpcyBicmFuY2gncyAnYXV0b3JlY29uZicgb24geW91
ciBmYXZvcml0ZSBwYWNrYWdlcy4NCj4gVGVzdGluZyB3aXRoIHBhY2thZ2VzIHRoYXQgdXNlIEdl
dHRleHQsIEludGx0b29sLCBhbmQvb3IgZ3RrLWRvYw0KPiBpcyBlc3BlY2lhbGx5IGhlbHBmdWwu
ICBJZiB5b3UgbGlrZSwgZXhwZXJpbWVudCB3aXRoIHRoZSBuZXcNCj4gLS1leGNsdWRlIG9wdGlv
bi4NCg0KVGhlcmXigJlzIGEgcmVncmVzc2lvbiB3aXRoIHRoZSBmb2xsb3dpbmcgY29kZSBpbiBn
bnV0bHM6DQoNCkFTX0NBU0UoWyRhY19wcm9nX2NjX3N0ZGNdLA0KICBbYzExIHwgYzk5XSwgW0FD
X0RFRklORShbQzk5X01BQ1JPU10sIDEsIFtDOTkgbWFjcm9zIGFyZSBzdXBwb3J0ZWRdKV0sDQog
IFtBQ19NU0dfV0FSTihbW0NvbXBpbGVyIGRvZXMgbm90IHN1cHBvcnQgQzk5LiBJdCBtYXkgbm90
IGJlIGFibGUgdG8gY29tcGlsZSB0aGUgcHJvamVjdC5dXSldDQopDQoNCldpdGggbWFzdGVyLCB0
aGF0IGNoZWNrIG5vdyBmYWlscyBhbmQgdGhlIGNvbXBpbGF0aW9uIGNoYW5nZXMuDQoNCknigJlt
IG5vdCBxdWFsaWZpZWQgdG8gZGV0ZXJtaW5lIGlmIHRoZSBjaGVjayBpbiBnbnV0bHMgaXMganVz
dCB3cm9uZywgb3IgaWYgYXV0b2NvbmYgaXMgYnJlYWtpbmcgY29tcGF0aWJpbGl0eeKApiB0aG91
Z2ggbXkgaHVuY2ggaXMgdGhhdCB0aGUgdGVzdCBpcyBiYWRseSBjb2RlZCBhbmQgaXTigJlzIG5v
dCBoYW5kbGluZyB0aGUgQUNfUFJPR19DQyBjaGFuZ2UgdG8gcHJlZmVycmluZyBDMjM/DQoNCkNo
ZWVycywNClJvc3MNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWls
IGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJp
dmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRl
bnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3Jl
IG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==
