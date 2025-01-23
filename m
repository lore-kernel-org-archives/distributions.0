Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFAF20B22
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645584; cv=none; b=cNKJEm7Yykj+OlhYcehjl3cTZN6I3eL8yH6F+ZRwxKLUCNQkKzHL96OS+s8aS5VoMFNWopuWU1fnqWNA+c7jhYkHm+CSf8Nl5slOZU/B9GAAXLPCJDUHUm2G+6oMK6WZf27M7Qfyj7tFYfivh8fCAk0Uvi0KwcG/pMV+kX1uvoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645584; c=relaxed/simple;
	bh=T3gX99wbK2sMoLQxCX5z+336nCTaz1YDYLcRTXR5v54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzeHi4kiscchy/ljzKmxU56Z7myfozeueQkFhu7iNb+GRYZa4kuwrVjFxtGekBhmO2D9SqUd4CGlideCzIutGZNfAnLtDwn5eyjV50P+MGJTKW+cjY8wQTxWmLtHl22DXT8SYUsQn7osYPcx8kWJglH15fGJpJenLyVWXq3KRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name; spf=pass smtp.mailfrom=coelacanthus.name; dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b=qFDEgIJT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QCZYmxek; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b="qFDEgIJT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QCZYmxek"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 297C9114012A;
	Thu, 23 Jan 2025 10:19:41 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 23 Jan 2025 10:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1737645581; x=1737731981; bh=uZvuCuPEdi3r1xEAqZXLC
	CxkFJeCWdrggQCv2gaQwgk=; b=qFDEgIJTFsRtkjckH1pXGXUO+JHzs/jWJCkGM
	OkZGmNw6kzUWqKzPo3/Gn1uX0vVf7fCb6dZC+EqW4fv0vZXAW9GswPBnbZnlvYT6
	0X/YBUgbicjixb/CrcKkRY3bdlonbf6EoqvW9p3PM08WO5eF5HPZW4gTuiAJt4XO
	QOvsUQFsXrbrvQDHwwoy4SSo8drFmDpc+VDarPZ2qotlCejArfb3eRW3+S68SjR7
	X4FIN5PzpbMw2js9xspaEwNCRHTNZY5lhlVCylBJJ4AeIwjGsZ7nc26OCLm/KZM+
	uH9osPJ+gPSFV4uCq4VaEvGZJp1b8nZPc8uURdHpqFYN/xJdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737645581; x=1737731981; bh=u
	ZvuCuPEdi3r1xEAqZXLCCxkFJeCWdrggQCv2gaQwgk=; b=QCZYmxekiLcGMEnvn
	RWSBFOsI136Cd6lUriuDRsEpx9629OZDBs+q7TXtf5PS+5HqnrSEDpojclbRFMvz
	lGrS3WctbSPmJizbz4LYiE+6jgeX2eQ1uX+DFQhodk8GXMu7ze9sLnW4uDuGmwGk
	e8OY1d1qnkf+eDjNA5SKxn+vPJNBsqm7xbEr7EIAR3L7UJav2JGN7xKV9jshQreN
	vkAlXCjMCdl5VmxooSjdpMluD9XkQ+LYsjE5xB+UK3yTU1U+EzF2l5olNDRrjO1b
	YjORCVSkNMWwlSiisKjHV+1BFSnsbJwDwUxWXY7SZSu/hLN4noabdU/6EDc1TimZ
	uC4rg==
X-ME-Sender: <xms:DF6SZztc6SbciZ7uUP_cot6HOBzW7_GckygKQjofgMSAHarjmgfehQ>
    <xme:DF6SZ0djk7L4s3wUWSEImBSQPoVvShinMXvSpvugoUoFnwDcpw5suWtB6BYxta-GD
    cuU5ZWdr-UnZzFJmLw>
X-ME-Received: <xmr:DF6SZ2xnx4LA9pIEk18iFVy_hJ_kJvAKvwMGuXXEJaJg_DnvM3wzQYS7d8z2pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgjfhgggfestdhqredtredttdenucfhrhhomhepvegvlhgvshhtvgcunfhiuhcu
    oehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvqeenucggtffrrghtthgvrhhnpe
    dtudeltefgjeeigeehhfeifedthedtjeetudefffeuteektdfffedtleetjedujeenucff
    ohhmrghinhepghgvnhhtohhordhorhhgpdhfvgguohhrrghprhhojhgvtghtrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhes
    tghovghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepfedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhhgohhrnhihsehgvghnthhoohdrohhrghdprhgt
    phhtthhopeguihhsthhrihgsuhhtihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtohepuhifuhestghovghlrggtrghnthhhuhhsrdhnrghmvg
X-ME-Proxy: <xmx:DF6SZyN9RRp-heJsjEzC9PtRsh_yxeh2BQn-VJDcnDTbV4PNBfxeiA>
    <xmx:DF6SZz9-i5ChBqkB6F7HY5SSKWkE3Kqc0-X_EqzNp6IAbaH2O77D2Q>
    <xmx:DF6SZyX3y2OzHBrPUoBN3GoK0PSjaMoQoNKLVXksq_mt85j0XXECJA>
    <xmx:DF6SZ0cKnRwzheiEJ6EYXPxkH5pnWT2VNGOJnQf0oBelu0ydlGo5GA>
    <xmx:DF6SZ2Y8zCQWpKuZU8OkApqsHck1kFNlav22j7byIcgNOrM6fK1B_Y5b>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 10:19:39 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
To: mgorny@gentoo.org,
	distributions@lists.linux.dev
Cc: Celeste Liu <uwu@coelacanthus.name>
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment variables
Date: Thu, 23 Jan 2025 23:19:17 +0800
Message-ID: <20250123151916.476793-2-uwu@coelacanthus.name>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7361; i=uwu@coelacanthus.name; h=from:subject; bh=OtP1FW8jGWixkaJC9nDU1yUmZl3PAik+N/tWVtAj5II=; b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9EmxXxquNNm32Xfu2Hn0zqtZuy4qx02+qiRvJxiw8 +Uux913H3p3lLIwiHExyIopsuSVsPzkvHS2e2/H9i6YOaxMIEMYuDgF4Cb/Y/jDdfKwQMzq54cP /A6qvXmPhSdWtKxsy/Ip6f7TlvIlbHxkyPBPlS2hao1e3HqD+TPNKvOeNewz0z3HYNx1Imi34fu DrLPYAGy5TAc=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
Content-Transfer-Encoding: quoted-printable

On 2025-01-23 21:14, Micha=C5=82 G=C3=B3rny wrote:=0D
> Hello,=0D
> =0D
> As a packager, I often find it necessary to ensure two important aspects=
=0D
> of the build process:=0D
> =0D
> 1) that the build process itself doesn't access the Internet,=0D
> in particular that it doesn't download any files on its own,=0D
> =0D
> 2) that the build process uses system shared libraries and other=0D
> dependencies whenever possible, rather than vendored (or downloaded)=0D
> copies.=0D
> =0D
> Unfortunately, these requirements don't always align with what=0D
> the upstream considers best for their own use and what they consider=0D
> the best defaults for their users.  Fortunately, we are often able to=0D
> reach an agreement and get the options to adjust the build system=0D
> behavior.  However, these options are often defined per project=0D
> and they aren't necessarily consistent across different projects.=0D
> =0D
> Given the recent success of how the NO_COLOR variable [1] became a de-=0D
> facto standard, I was wondering if we could perhaps attempt to=0D
> standardize environment variables for these two aspects as well.=0D
> I suppose many other distribution packagers are facing the same=0D
> problems, so I think this mailing list is a good place to discuss this.=0D
> =0D
> What I'd like to propose are two environment variables:=0D
> =0D
> 1) NO_NETWORK -- if it's set to a non-empty value, it requests that=0D
> programs don't access the (TCP/IP) network.=0D
=0D
It may be better to be named NO_INTERNET. Network is a confusing word in Li=
nux =0D
world. They can refer to something from only Internet to any protocols in =
=0D
network subsystem, even include AF_NETLINK... I have been asked why my udev=
 is =0D
broken when my program is in a netns many times. Systemd also have to infor=
m =0D
this point in their document of PrivateNetwork. So use more limited word =0D
Internet to avoid this.=0D
=0D
> =0D
> 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests that=
=0D
> the build system does not use any vendored dependency for which it=0D
> supports using a system version instead, and that it links to shared=0D
> libraries whenever possible.=0D
> =0D
> Some examples and thoughts below, followed by rationale.=0D
> =0D
> =0D
> For NO_NETWORK, my primary goal is to have build systems not issue=0D
> commands that fetch stuff from the Internet.  For example, if a build=0D
> system supports automatically fetching and building missing=0D
> dependencies, setting NO_NETWORK would imply that it would fail instead.=
=0D
> Technically, this could also be extended to tools like wget, effectively=
=0D
> blocking Internet access on multiple layers -- but that's not strictly=0D
> necessary.=0D
> =0D
> Another use case would be test suites with tests accessing remote=0D
> servers -- the variable could automatically cause them to be skipped. =0D
> It could be also used e.g. by pytest-socket plugin to automatically cut=0D
> the test suite from the Internet when loaded.=0D
> =0D
> I think it would also make sense to imply not accessing local network=0D
> services, in particular local system services.  An example of that are=0D
> test suites that connect to the local database daemons rather than=0D
> starting their own isolated copies.=0D
> =0D
> As for the rationale, my focus would be on security, =0D
> and reliability.  Package management systems in general implement=0D
> streamlined procedures for fetching resources, including verification of=
=0D
> authenticity, use of local mirrors, caching and so on.  Fetching=0D
> resources directly bypasses this.  This could expose information about=0D
> what is happening on a particular machine, cause unnecessary server=0D
> load, cause fees due to data plan use, cause failures due to shoddy=0D
> Internet connection -- similarly for tests.  I've written a more=0D
> detailed explanation once in the Gentoo devmanual [1].=0D
> =0D
> =0D
> For USE_SYSTEM_DEPS, the primary goal is to build against system=0D
> dependencies.  For example, some upstreams either prefer using vendored=0D
> dependencies or fallback to them when the system dependencies aren't=0D
> found.  However, in Gentoo we really do want stuff to use system=0D
> dependencies -- and if we miss to specify them appropriately, we'd=0D
> rather see an error than an implicit fallback to a vendored dependency.=0D
> So if USE_SYSTEM_DEPS is set, the build system should enable using=0D
> system dependencies whenever supported, and disable all possible=0D
> fallbacks to vendored dependencies.=0D
=0D
Some build system (e.g. Meson) have infrastructure of switch between system=
 =0D
library and vendor library, it's good, we only need to expose the switch vi=
a =0D
environment variable.=0D
=0D
But in many build system, especially in "modern" build system like Go, Carg=
o =0D
(Rust) and NPM (Node.js), they are not good on this infrastructure:=0D
=0D
Cargo users normally use feature gate to control whether use system library=
, but =0D
the gate name and the gate direction are not standardized, someone use =0D
'vendored-xxx' and some others use 'system-xxx', and in Cargo we can only =
=0D
control the package behavior we faced directly, not indirect dependencies. =
if we =0D
want to control the bahavior of dependencies, the only way is hoping ALL th=
e =0D
package author make a feature gate to pass this switch to its dependency.=0D
=0D
In NPM, the situation is even worse. NPM ecosystem prefer to bundle everyth=
ing. =0D
They have a --build-from-source in node-gyp, but not all package use it and=
 it =0D
only affect the library that will be load by nodejs. In fact, many nodejs =
=0D
packages, especially which have some web contents, may download a copy of =
=0D
chromium. The switch for it is not standardized and even not existed in som=
e =0D
projects.=0D
=0D
For Golang, it doesn't have any infrastructure for switch. Their library is=
 like =0D
an union: either use system library or use vendored version.=0D
=0D
So the first step may be to build a basic standardized way to use system =0D
resources (include link library and use some executable files) in these lan=
guage =0D
and build system's ecosystem.=0D
=0D
> =0D
> The wording proposed above tries to account for the special case when=0D
> the package does not support a system dependency version at all -- e.g.=0D
> when they are patching the vendored dependency.  It's not ideal, but I'd=
=0D
> like to avoid blocking a major improvement just because we can't get it=0D
> perfect.=0D
> =0D
> The rationale for avoiding vendored dependencies have been repeated many=
=0D
> times, we have one on Gentoo Wiki [2], Fedora has one as well [3].=0D
> The main focus is ensuring that our security team is able to address=0D
> security issues, but being able to fix bugs and simply avoiding=0D
> duplication is also helpful.=0D
> =0D
> I've included mention of shared libraries since some upstreams seem to=0D
> prefer static linking for similar reasons that they prefer vendoring. =0D
> While technically this could be considered a separate issue (and perhaps=
=0D
> deserving a separate flag), I don't think there really are distributions=
=0D
> who want unvendoring but not dynamic linking, so it's simpler to have=0D
> a single "distro packager mode" variable.  Again, it assumes that there=0D
> will be cases when dynamic linking isn't possible, particularly when=0D
> there are no shared libraries.=0D
> =0D
> =0D
> [1] https://devmanual.gentoo.org/ebuild-writing/functions/src_test/index.=
html#tests-that-require-network-or-service-access=0D
> [2] https://wiki.gentoo.org/wiki/Why_not_bundle_dependencies=0D
> [3] https://fedoraproject.org/wiki/Bundled_Libraries=0D
> =0D
