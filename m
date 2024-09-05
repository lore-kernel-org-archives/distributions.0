Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819C154444
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554057; cv=fail; b=RxR+PF3FRPfnmDc8h9lF/WBQrvGyGhxwOxRJ5kv4jVG8GlF+AoF2QeNID+oL6rc/YsR0h6disz6CGKj9dJ1QoJ8xxOM6TAbOKWThLjLxhVejF1ylRDVzaGc/ASEDbVudbfWMZym4EILcBShhz9BRCaUPTx8KMe5gNkVxRrnjVy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554057; c=relaxed/simple;
	bh=6khTiIQcwTIteOZKVJcgXXFhGNMCe+fXRiHRmI4VhC4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mv+1e7f8xMEMK98CRZH8O8/LkmUjtJZuGk1/uNPkFdmow+KoFv//ermYUo9kptMc7POJrgdsejHkiagLy5bDjEbt7Ug3uZCRffN7NcAPw6eOdnJVdGWxa80JzsVggx9xVW5ce6w/UVjtMaXXXlXPrXlSvOFvbjF7WUqlquuMyWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S/bJ5M5v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KNTF3sQq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S/bJ5M5v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KNTF3sQq"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485EtZkB013196;
	Thu, 5 Sep 2024 16:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=6khTiIQcwTIteOZKVJcgXXFhGNMCe+fXRiHRmI4VhC4=; b=
	S/bJ5M5v+WRz0/HqaC+Wrp0GWyfHsaoQwBkvfJ1Vtuenid6tzKLsrCNL+KkzyAxs
	/cG1o//7NBaDjOpng+UT21OwbYT1P4Zj4NYkn0C4Pn+v8s9RX+M6j24LErTwRgvs
	LbHZOlV0d50I5d90HTZkKDpw5qSqX1q0Vg2LlHa8BWRnmOU92PKYoivXvNAHQaTn
	9qjjGb3jvOPJH+vVWEynqXgKQTYxmCr/vNxkbWL9WziICYwA0mdgAB+ruXpr1tkk
	ec3o0EQ8FelTIlYjHm0hspiadBC4NlghVfVGyl7nwLq5TuQPI0cdH1H83ceXIHXH
	Ylhe+W3se1p44qS5sskJ/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dvsaecn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Sep 2024 16:33:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 485F0M8w039507;
	Thu, 5 Sep 2024 16:33:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmbrdpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Sep 2024 16:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AisHTAv9st8sPYMKoqwJNgYHf5YuSQMoV0nLzsVAtuEQN9FzBdQfezSv5ssu4+nPOcRU9QS5KLV6sZUM2eG6Q2CQ5elwqZ27TwMKpQGdQ0afbqN8h+QkPIoPYbAEuoeM3l9XOmilQ8xtysqn6ey81BYvJoFmhRVKh1tlP1UuoXAn7yXqK40AL2AAevRspDh89yjaW4BKgpUkimYV97vG3MQLQUvNFUoo1sW5GF7VHTSfjNuRnHGClBPmclf+0y0Bl9LNB/MU9ARozcPezWm4cRu5JZZuJ0o3kxnEA7Gi80l7/3pl7dfnI9IsjezxDr/c8QgTlakXh8hMJZX65bFbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6khTiIQcwTIteOZKVJcgXXFhGNMCe+fXRiHRmI4VhC4=;
 b=IrPXER/ZFyPnXb9H7mqivLYs8L0NQwAjo5y/y0xABMN64fMU22cM0EyKSDxjW8pgFOyO5PkaBz8LoH0WxdDrkBQaEbkbd8GcAa8TmjNbnKBYGPNq3sv7/BFIPjF5hwfE3hBDn7jQpaTCtVAezKr2g7o0EhORFnVZQqoIP9PrXsno3lYg34M4fhII01dbzmC+QmcHxYACfFhNaYijHQ7sW/Ud9szFgh+X8h0+gqYVtzG00UH8BX/RXPS0PpxS2E6jf3JcnLuu4xia0FphNadoHO1kpH90Nq49vflH0uJ7BYi8B6EVVaMeS/VK2Fu7LJfETNWhVWSJU+fSDVlHP7EAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6khTiIQcwTIteOZKVJcgXXFhGNMCe+fXRiHRmI4VhC4=;
 b=KNTF3sQqq0/6ELcljSYpZ9UZyPDrpI/ZH9n0quuoGAROfYwxOG29tgT3oltsD/+34nsP/yEW6MQgsGlCwvISelo/c1DfU3VeNAYfaLuUm+QMB5zySrEIVRQNiALS9mdjJ85dunWsUKTIdXJzUOqEIc/StPbctLOmxyhPEQYcHgU=
Received: from CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8)
 by SJ0PR10MB4432.namprd10.prod.outlook.com (2603:10b6:a03:2df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 16:33:34 +0000
Received: from CO1PR10MB4675.namprd10.prod.outlook.com
 ([fe80::18d7:6a59:a6f6:c692]) by CO1PR10MB4675.namprd10.prod.outlook.com
 ([fe80::18d7:6a59:a6f6:c692%5]) with mapi id 15.20.7939.016; Thu, 5 Sep 2024
 16:33:34 +0000
From: Todd Vierling <todd.vierling@oracle.com>
To: Paul Eggert <eggert@cs.ucla.edu>,
        "Andreas K. Huettel"
	<dilfridge@gentoo.org>,
        Wookey <wookey@wookware.org>, Khem Raj
	<raj.khem@gmail.com>
CC: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
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
Thread-Index: AQHa/uHk4mIYc5ZkJUKcsWvFLxFXqLJIcp6AgAASAACAALLhAIAAHlMAgAAIXn8=
Date: Thu, 5 Sep 2024 16:33:34 +0000
Message-ID:
 <CO1PR10MB467524D51DAB97012807DE11929D2@CO1PR10MB4675.namprd10.prod.outlook.com>
References: <4996568.GXAFRqVoOG@noumea>
 <20240905020617.GZ23787@mail.wookware.org>
 <CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com>
 <3848277.MHq7AAxBmi@noumea>
 <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
In-Reply-To: <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR10MB4675:EE_|SJ0PR10MB4432:EE_
x-ms-office365-filtering-correlation-id: 9310054e-4b40-43b8-6d33-08dccdc87c49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7VZUPLIMKMevyMaMksmx1lOK3mKHq39vEnS+W/LlOKP1446fpIrKEED7+J?=
 =?iso-8859-1?Q?koVJCy4Jsc1wXCQo1L8LPbmjEMMiUgWQslz911dEAr9qOvy4hQpXh7Hzkv?=
 =?iso-8859-1?Q?wzKdy7zJ4Wd2YSKh0YIDuYhlsKWdR9UI4DPhL7YRDps1JwDMSB7Ium1OYn?=
 =?iso-8859-1?Q?ugssLa/Ureno4yiOW0gEPlw6hCQXEDewtk4GBOSgolV5Eqr+x4DkAo4b+6?=
 =?iso-8859-1?Q?4Fi/MmaOb5v4acfg2iHk+JSO8k+hTYbu+CO5RWpj1j9nZiI7BO0WBY+vUp?=
 =?iso-8859-1?Q?ysM76QnJ1nipGypbcqM4df6U5w1ByZ10iyrcATBqABAKA983wc7gyzRJgB?=
 =?iso-8859-1?Q?Dus0+upl9Z7j6gmikHAqEQezAe3zFhsBL1QoCCUerTxdwoTK0A+S5Mp6jo?=
 =?iso-8859-1?Q?qef+NSemrZ5Ex5wdMQ0J0TLtOQWezvHNAHhrX6xwx7R01uCqlFGrDTHOfc?=
 =?iso-8859-1?Q?3Bmu9r3e9wj8trEWJICO/nWCBLbaQYKkxEg1QqgT2Hk3pbCInQI9AcR+Mg?=
 =?iso-8859-1?Q?6Qv/SvTCLWboFqnlUaBQdxi0KBiRvqg3rBud7u2Krp8AE98HR00HS0e3En?=
 =?iso-8859-1?Q?UUJRSSihABfsCe4NDGz60+IXeLcrdMPLt99AYqjHVZJfizJ102mjSa2sto?=
 =?iso-8859-1?Q?GsVD/2t1Mz3CYPreHEWzbef294BTdcJts4/RJG+yLrdRFghCkEG/Zs6qbz?=
 =?iso-8859-1?Q?etGncAV32MMBXCUU/wtt35L0hI8hw9VaaIlsSgjmzzUV9SqWBT/6ei0u8y?=
 =?iso-8859-1?Q?rsBR1w7HG21+6bKT3AqNayFZNcwbe+6hsb8z4Qlx+Wc26XcUcaJuhvgADT?=
 =?iso-8859-1?Q?8zCQh0Iuq7P0sN3mAndh4cfyJMAGqZxjrbxPc2tYuM2Z2i/hSRa2KvP9jk?=
 =?iso-8859-1?Q?rH3sO3Q0nkQlVQhVtOP9EtlKS9oHHmistN6fWNPNKnNpRnjD/EmGE6jy22?=
 =?iso-8859-1?Q?zT11vYNIlUlHtPMFev5TVju8XbeV7xlQAV63zDvQy7b9qt5yj7gmXvh7Ce?=
 =?iso-8859-1?Q?xXQDX7JJ8A7ULHi9ffTsR10ESGJFyaSDOc+tXoHFaGZYEOUDKemcunT91o?=
 =?iso-8859-1?Q?jvSAqxzrZHoqnX49iW16ptvqJ8iM/KAWhTXa4SeLh3/A94v1EqX+WXHLhl?=
 =?iso-8859-1?Q?/AOy1JxcdF3pBQr4a8Bd+tpPcW8/ziPHnIIlIpWVAqcIRaXh4rZJ4mPIqI?=
 =?iso-8859-1?Q?ek5pXishT3Ens1lAmiweKbg/UchwOmWPhhmD3vrAsGnoBL7IZvXjDJPCNQ?=
 =?iso-8859-1?Q?wLNekvOdhsV+9wp9vcFW2l6NeY35jreO9cmzzFus9BLGqEzirMCM8p5pbh?=
 =?iso-8859-1?Q?nL5klc38MaKW/NmfljeKefpERRzrImlK9DkZDWrflApy+4M06GdR13dXv6?=
 =?iso-8859-1?Q?2eMyQVgw2UxxMu+B5TnBOS/S/TmgR6vx/5zSf+SVhO1O8+EXopFzM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4675.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AaSPpzo4AIZk6fmroUZNQgFQNS9UIvjcWtZcHcl5KgEijZtWN7PBNmeufG?=
 =?iso-8859-1?Q?Fg8fDdvEgEIhV6f/yWUt7BN6BYtB3eCH6RmRNtei/N9vLVWuAu38lBhz6i?=
 =?iso-8859-1?Q?3k1TJzmtEuqIP714tJpre3cl9xYmi4H8vmjtxSyGzTZQcDh3K1LTEl3IHh?=
 =?iso-8859-1?Q?+jeo/WOEvzBDH9ZKREta0Eu/6Sc9V6QdJkktzoPUP+6Hfx0N5INgUNg7Pd?=
 =?iso-8859-1?Q?AAVfVcv9w0+mow5f91T+MAaJRgCrUs8BKwGauVwQDaWszfiHhGQWFKWDMz?=
 =?iso-8859-1?Q?vTWvNW860KiVp0K531GbAynVG1fzw2WLPzR9v1Envn+SAb2Hq8TZgkHqXl?=
 =?iso-8859-1?Q?rsxWoPLXRL1JGKSJBWTCYNWGMShjISK5ciHRyUgp+pXre/nrTRv1Hmuu2H?=
 =?iso-8859-1?Q?VC04xJ0t2slSPyJqXUt+kPdQvC27Y0kbr1YHhp9Xoh/SdG+ZfGkEbyRUc+?=
 =?iso-8859-1?Q?bkK4vtoV/Js4K2b4ymyZPRKiKDf0pTIsQMzOMjfLJNbVbh/x1NZJ0qDA+f?=
 =?iso-8859-1?Q?Pdn12x+HTQAN+UfgWPHlA3aWdy7iIY2ITrQ0jWwTxtk+ETJO10SdV3Fh0o?=
 =?iso-8859-1?Q?A61UDvh+oP+NE2xLXGMw83NxZv4hNCtUf0oWLxdgLryvq7sD3lO49oi7kL?=
 =?iso-8859-1?Q?PT+QJ1h03j/pDAdIRME4av4GIdDcHEtcZgCNERJderDqpxZucm5VNZ/Y+r?=
 =?iso-8859-1?Q?zyf6aGPDeqysptdFxVxqqJY8ypIlARuow15KoMJ2zrhP6hz6+So+GweNda?=
 =?iso-8859-1?Q?71tSK6Y7ugH6YiHz+tWSqmoxgOUvQsT04Z7B2TJgNeD6YoUj53cGflNEtF?=
 =?iso-8859-1?Q?FG3Y4VmuCAkWAb/gz1IdwgXryXNYZ2i2fd11vYKmqUDFRTpE0pYsYRt3sB?=
 =?iso-8859-1?Q?WFfpQwYrBYfUvHVEaJ5kwbSGbsZ/Fe1vR6S3UtzSEl5h5/VP+1tazvf2gs?=
 =?iso-8859-1?Q?CzRK/dn9gIpMKC4TvrgVMBkNsjcwq2otKHMnfBQItgO+KBMxnwXtrEKlYb?=
 =?iso-8859-1?Q?mDY3r7pvYscs+/zS0ZGEWpjKLk8x0KUJQcqSWlY7MxkiMxWYhlZIa8HWxW?=
 =?iso-8859-1?Q?3GNWCEaJhf5Dmh/K3MTxvOT3H94QwKNK52T4f99nVpe4GTQBUKcPjBrSHw?=
 =?iso-8859-1?Q?iat6EVdTOi48VKh84/Zo5H5FkaJmsMEWHqbGCbMXcxyKXLKa/1g9RkUNRZ?=
 =?iso-8859-1?Q?FGLRgim8c4mQI+LKg+ZTHPiJBoRybYq4qbM8LXdUyF7k9dh6H0mFoQyEw2?=
 =?iso-8859-1?Q?Wp5PI1hZDuYcej81ofpligJrN8ZG4KDv+ZRvJeq0BKLYVDspjErvelYEG8?=
 =?iso-8859-1?Q?p42MZ96Na0vVIZpnOL5uVS0Eq+Jf6kVYt0hmqJa+o71q/H19MLapz5U4vh?=
 =?iso-8859-1?Q?X7tE5crMu5yS/cUFwCYWQwAFQJZUyFM8I1MuFrp7+UjhhcyZRKn9faxPy8?=
 =?iso-8859-1?Q?8rvTZBO0B/8NSEA/PIhUAiuKDQsc6CYGBttORXh27PLxYfpOv0dKZJkAzX?=
 =?iso-8859-1?Q?KegV7Du3iEssNbW7JZzFoAaCAJRCfQm6OYdJcFGz9+Gnt2rNs9VthkGZe/?=
 =?iso-8859-1?Q?bZDkjHKN5iL4mP3GQjOC8ipuXZ3cvaJRqneXoR86Jy1C6K+Y7R3ncXZ0dx?=
 =?iso-8859-1?Q?xXANTaqdFawqmPUcnC13lwEO/+v3a7hRUG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DSObU06/1DmlzzmUM8rFJ+0/Nu2k+qnbdCRxhUoCJsJe9RHA36bEhR15vRQ26JwXo0IiTr098AT7O6f5bwboRV6R0yGjU3up4lgAE18Rx5+2Bz1CcjYYAC0RosDkMhXwV3dPD6Y5XvcQ7aLVMauy3WxunUiQJdgSJu+aucpikYkGVFi4HJFYQRHfdEoafGaAbsT3aDbUSJ84Y9eEufOldvEC14s2HUCe+6ru7Pr5RNwNNsUWE1lGVQR13Uw/vpJo4VBkRb/dfpsnh4tDKsFn7cIDmGqkjnbIoEW5kdKaHan8MaJSj7OoMfWvg/FGBOjrVOnvnx8K1ed3YaaVHK9TwhmHFPtFamNJDO1/H/6/mt7Vbpv8BV4zVgwM4KAi1HKbN0hF0A45wGKNqk4ZEygkIiwunqKOFV7vbD4w5IrVpS3pFIFdYORyG/cMFhAupRLigr5Z7xd21oHXXjNVi1DhGxm399LkeFGET83WMqhYYeY4YcAaGMMUGS9/raJsOwVQ0UaiKSdYgTW7hSEloCDuVqFoucJHMC81htrLIFqxTP/GLtnxoMvEugCNtJT7NxEt4KooRkPQQR+o35J9j+Hz3+SdBWzPU7E55/hdYK/IPjQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4675.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9310054e-4b40-43b8-6d33-08dccdc87c49
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 16:33:34.1882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSDf9nj6qt9plC9Jt3Me9SZfVUmz0CE7/Huv7b3aG6AokPcWxva3h0qjcTu2kc3M7ZYIFyPwLUNTpgwTLPnbvkRACOMGqex7RBCmeSVh0lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4432
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_11,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409050123
X-Proofpoint-ORIG-GUID: W6j0Mbk001dkFU5jdV4SXhOwVxxIBEkI
X-Proofpoint-GUID: W6j0Mbk001dkFU5jdV4SXhOwVxxIBEkI

> One possible improvement would be to append "t32" if you want 32-bit=0A=
> time_t, instead of appending "t64" for 64-bit time_t.=0A=
=0A=
Versioned symbols in glibc should mean that old binaries will still run (ev=
en if they misbehave when they look at the system time), just like with mos=
t previous ABI changes to libc over the years. Generally the triplet has ne=
ver changed except to flag that something is being intentionally built for =
an *older* API/ABI. For instance, autoconf had for some time a separate tri=
plet to identify a.out/libc5/glibc1 when ELF/libc6/glibc2 had become the ne=
w standard, flagging the deprecated rather than current revision.=0A=
=0A=
Like previous base libc ABI changes, yes, it means rebuilding all downstrea=
m libraries and applications to make use of the new API/ABI. What matters i=
s whether it's "easy" to pick up a mix of shared objects built for differen=
t ABIs which are representing a data type differently. The thing being aske=
d here is fundamentally a search for a technical solution to this risk, but=
 changing a triplet alone doesn't address that risk at all.=0A=
=0A=
Some technical options to address the actual question include:=0A=
=0A=
1. Total flag day. No versioned symbols, no compatibility.=0A=
=0A=
2. Partial flag day. Provide only the bare minimum of compatibility librari=
es, and intentionally change the versions (sonames) of libc-downstream libr=
aries so that new binaries won't pick the old libraries. Applications that =
dlopen("libfoo.so") will break, but... please don't dlopen() an unversioned=
 .so filename kthx because that already risks ABI breakage.=0A=
=0A=
3. Keep new libraries partitioned; no more installing directly into /usr/li=
b{,64} depending on your distro, rather everything must now go in a new pla=
ce, and the dynamic linker needs to know which paths to use and which to ig=
nore. This would require new executables being tagged in some form at link =
time.=0A=
=0A=
4. Same as (3), but the dynamic linker needs to know where *compatibility* =
libraries are installed for older binaries, and choose that path in prefere=
nce instead of the standard one. Still requires new executables being tagge=
d to tell the difference.=0A=
=0A=
-- =0A=
-- Todd Vierling, Oracle Linux Sustaining and Security <todd.vierling@oracl=
e.com>=0A=
