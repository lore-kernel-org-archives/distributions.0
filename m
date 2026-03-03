Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D993537D3
	for <distributions@lists.linux.dev>; Tue,  3 Mar 2026 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558457; cv=none; b=lDhCywrRo3CbJfjHxVa26oyvOwgD/wMtTOJM22pRrKt3TJbjnt6/iYR1EakXCyrP1xlH7hBFm4VAiJXExEApOK4sLp628w4EQtT+xsKeUNvcAA9fOCLcChP+OY7G2dMT5Kp0tRY5wDOMF9FPdREvC6Zje20eeD1SkPk1jH2Ksv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558457; c=relaxed/simple;
	bh=2ztbLvRECqHQB4cSvhi7cALCPJc/CYrAzOg4PyTttmA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=bmWkliymIIn8UMbToEFv9ZQMJi+B4io8P9i+l44+67T1CGvXQ5gOshZKG3CLpehmfdGpteR6BSPgvljmvms0x8c7S6fBNl0avfitxi2Tg9iuX+JKTw0NcdSDgwCCWb5yt3OEliTvH6k7SxcbVlSjVQ9dKFUMX/1QaNL0pHcK8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org; spf=pass smtp.mailfrom=owlfolio.org; dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b=Br/eqxZw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=scCUBxLt; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b="Br/eqxZw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="scCUBxLt"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id BDF17EC061E;
	Tue,  3 Mar 2026 12:20:53 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 12:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1772558453; x=1772644853; bh=6W
	Vzt2qZ2l45D0e/CzxfCU4B4IrvgUhkRsxXqcmyj7c=; b=Br/eqxZwh1PY+P9nen
	12e5f7TAyabKwg95Wqs2O0tA8IEX82ng0qmLNy4nsYCw30u1yzywmCbMBGFx9BIF
	amWRM5fwYr8mhH0cmvBUUYjZYfL8o3KIj1FO6YiukO19StqGv3mXdmprd7sPVE1z
	8VTM6sG+VAPMsnothZWksn+I8yx5Itzt8+55ljMnhgrTRYlKvSO53YmfbWDPZmgV
	OGhew1TMejHi1V8qpHww73LNJ7J+7UeswRufHVdosupG11BL8evcFa141qD3U1k+
	apY1LpeYR9cU3K5SJN5fOpg4+5VbkwPO+n6hVNQFrYkt7WPTo3yrq8B4nz9qzfBH
	rBzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1772558453; x=1772644853; bh=6WVzt2qZ2l45D0e/CzxfCU4B4Irv
	gUhkRsxXqcmyj7c=; b=scCUBxLtrb9TwVsUwSrOIAJHFKpW56a4k+Dsqxnac9+u
	S1usnaRUEpQjPNgQRTjMJiGCQFsCBrugIbvv+kzU+wrXULbzL+QNYA9aPs++WQyy
	3d/7lk0wigyPiUhgKj2nBmBe2qVrGN/37S7aixzdNiqHY2yCxotHGGvRs8KX2/Ft
	drz/cuIgbKF7ov3ilK0Y3EIHs5d/JQNrBlxG5h3IqkDM7Qd1Bd74388ISNU3MMl+
	dBTaPT5eJW1g8mNRb8oa/qoTXPR8sfHj7gSsVmMB97UvjJQRAykPdOVjFeF/PVIb
	Ag8NG8wcPeJRoMFo0bnHnOhfJZcwJYP+wo6m3lEs8w==
X-ME-Sender: <xms:dBinaSddl8YlGd3qEoGPPXVspo0B35iMdm4_feEyfxQSSn3Pn7qiZw>
    <xme:dBinaXCHphnIinhLirVizWbtdJMsKZA2k4fb-eDRC9NIcpfo-fMzbPhWSfXZcUTu8
    _EF45psJ5m7ET_x8fd7vXSxvJ2GUMrLcDEGqQZpYe45MtegIelkRSo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedfkggrtghkucgh
    vghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqnecuggftrfgrth
    htvghrnhepveeggfelleeuhefhffevveegueevgeduvdetjeekhfevjeevgfevudefuedt
    gfehnecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepiigrtghksehofihlfhholhhiohdrohhrghdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoshhsrd
    gsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegsrhhunhhosegtlhhishhprdho
    rhhgpdhrtghpthhtohepvghgghgvrhhtsegtshdruhgtlhgrrdgvughupdhrtghpthhtoh
    eprghuthhotghonhhfsehgnhhurdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdht
    vghsthgvrhhssehgnhhurdhorhhgpdhrtghpthhtohepughishhtrhhisghuthhiohhnsh
    eslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:dBinab_mYRcpeGDQLdhpG51KvG5a1Mzv1I4wUH2oLEawabvE8-a3HQ>
    <xmx:dBinaSr4QtMWbgLjaG70zehKb_XmlKM0ivpXSiugQNxy7irsHIiWWw>
    <xmx:dBinaYDcOV90LhYMn1i3PhbERyghDTOecdhISA5885mO9n4-KiqlDQ>
    <xmx:dBinaczmi8w5NHUcOMW3qTsiYzPoGhQxHmElsc01vWDTYw0aDLUA0Q>
    <xmx:dRinadKHEzvemmCF8LRQW97SmcB1lsm2JKKTndzr2VcJwk6FqRqGTF5N>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A4FF8C40078; Tue,  3 Mar 2026 12:20:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 12:20:32 -0500
From: "Zack Weinberg" <zack@owlfolio.org>
To: Autoconf <autoconf@gnu.org>, "Ross Burton" <Ross.Burton@arm.com>,
 "Bruno Haible" <bruno@clisp.org>, "Paul Eggert" <eggert@cs.ucla.edu>
Cc: platform-testers@gnu.org, distributions@lists.linux.dev
Message-Id: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
Subject: Please test autoreconf from zack/autoreconf-exclude branch
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The last thing I want to squeeze into autoconf 2.73 is a new autoreconf
feature, an option --exclude that can be used to tell autoreconf not to
run particular tools even if its heuristics say they are necessary.  We
had a lot of problems in the past few cycles with autoreconf running
auxiliary tools when people didn't want it to, so I'm hoping this
provides a self-help option for future issues along those lines.
(This feature was originally developed a long time ago by Ross
Burton for the Yocto project.)

However, squeezing features into what would otherwise be a release
candidate is always a risk, and we don't have comprehensive tests
for autoreconf.  I have not yet pushed the patches for this feature
to autoconf development trunk; instead they are on a feature branch,
zack/autoreconf-exclude.  Get it like so:

# if you don't already have a clone of autoconf development trunk
git clone https://git.savannah.gnu.org/git/autoconf.git

cd autoconf
git switch zack/autoreconf-exclude

git status # should show no modified files

./bootstrap
mkdir _build
cd _build
../configure  [options]
make

---

Please test this branch's 'autoreconf' on your favorite packages.
Testing with packages that use Gettext, Intltool, and/or gtk-doc
is especially helpful.  If you like, experiment with the new
--exclude option.

If you can, please also help me write tests of applying 'autoreconf'
to packages that use Gettext, Intltool, and/or gtk-doc.  The most
helpful thing you can send me is a complete test that can be dropped
into autoconf's testsuite -- see the "Package requiring libtool" and
"autoreconf --exclude (libtoolize)" tests in tests/torture.at for
examples of what I'm looking for -- but if you don't feel inspired
enough to learn Autotest this week, the next best thing is just a
minimal configure.ac + Makefile.am that will make autoreconf think
it needs to run one of the above tools.

Additional testing of the changes since autoconf 2.72 (all of which
are included in the feature branch) is also, as always, appreciated.

Thanks in advance.
zw
