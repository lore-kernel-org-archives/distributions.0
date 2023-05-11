Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDD1B8FA
	for <distributions@lists.linux.dev>; Thu, 11 May 2023 09:27:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 30C6D320093A;
	Thu, 11 May 2023 05:27:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 11 May 2023 05:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1683797268; x=1683883668; bh=vrC0jIkJ13sitSgpeG0++m5eq
	OkPyiIO4dXLHTAPb98=; b=aeyVB3dSy4brTVTxbKwcr6kW3hKsYiL4qt909ZiVv
	HSnybhqAh9TSD/co750eEue4188CSblo/c2l9ErmfDYZewHa1ZSYVLWeY0sbtMBN
	26xNi58Uts8/3vG2j4AMFLJ8egBAABiNztcR4XwngAo08WYQZoiJjDxaF13B78RR
	YYsZ8XaFqI0qk1r773f8kugJp+gu1p6MhBKNSH8CGSLMl+Ltx4dOO+7o+oxSaeiv
	j7DAEpy+6X1t2F+nn5WpiBlITM2qQliXuArYY1xOEEtZbjOE2zODk665E5lHNCcx
	rc95eF4LcGhmlvrES+/d8bnQzHK2PyknqtRBnGIfWre2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683797268; x=1683883668; bh=vrC0jIkJ13sitSgpeG0++m5eqOkPyiIO4dX
	LHTAPb98=; b=M4DpArYF4ScPziFxMuM04HUikAJiEpJ5OQYqZZOQYmk4uvk40bp
	cQxOHf4jplUwxAGBVbrYurcWM+WawD1Z/jhPxGlEuWCC6piWmjnDT2H/YHFq6b+f
	rh1qweDGco92uZX3tbGZzVMsx5JTLO3In8AhTMvF1L/+gQYOkb2pSjPdE0YgnYAp
	k97VfB4JFcOsdYGV1iNa8H9Rs4f50mMwXskyL4nOAvdo6YAWwJJ4VuY1LvesTSCS
	6dbYfKowshN7gyjVAjFQ4yjGDJGnmatuCwPDtnIOKvX+XiWuwtudQqNfn/9IqQCb
	sXBaeqIls/bbo2OzAEy420e/0UL3TsN9cgA==
X-ME-Sender: <xms:FLVcZB6sXIsNc724qclAOEnnbVC7-LuxjtHvm_AxpWttHBbLxvR08g>
    <xme:FLVcZO5YtpAhbeBQkMU64Y49C1tVwW-kwqW0z3vgbSMm3IZLfSTuCfp0AZSgge1WY
    Nhw8ceq175JkxBqAw>
X-ME-Received: <xmr:FLVcZIcJUsjxxgQk2Nf9Oy1rokUmWsrmKPa11CURAVlXmWiktmH6a-k1aOygRMGrk88oX8dzqQxaDjU6jwIYiE2kaSUeHp5TLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomheptehlhihsshgr
    ucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnhepfeevje
    fggffgvdfgveejffekvddtgeefkeelheffudetleejgeffvdehkeehhfejnecuffhomhgr
    ihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehhihesrghlhihsshgrrdhish
X-ME-Proxy: <xmx:FLVcZKLE1B7AMax6rHzknYPuNlU4FYB2y2BRndee1yxYK9lLrpwFTw>
    <xmx:FLVcZFIJ3UaW4-Tno5K4gJaKc4Zj-3-aY4jcm2sn5yIA2wKLFGxx6w>
    <xmx:FLVcZDxA-_bJDcwss4XfpsnKPO-8ZZjkwh7SfaLbSA9R0WwxNY7G5Q>
    <xmx:FLVcZMUu7W7OBIFwJ7VNulf-qh9JtjaVsxtyZistaCz0xlbd2YkaXg>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 05:27:48 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
	id 59DD646E8; Thu, 11 May 2023 09:27:45 +0000 (UTC)
Date: Thu, 11 May 2023 09:27:45 +0000
From: Alyssa Ross <hi@alyssa.is>
To: distributions@lists.linux.dev
Cc: primeos <dev.primeos@gmail.com>, Ryan Lahfa <ryan@lahfa.xyz>,
	Lorenz Brun <lorenz@brun.one>
Subject: Next Chromium release will require unreleased LLVM
Message-ID: <20230511092745.l53qykvz7roq4dqj@x220>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tml4et7uaqyawpg6"
Content-Disposition: inline


--tml4et7uaqyawpg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The Chromium 114 beta uses features from LLVM 17, but will release
before LLVM 17 does.  Currently, it looks like it wouldn't be too hard
to patch to make it compatible with LLVM 16, but in general, we don't
have any guarantee that Chromium will build with a released LLVM.

So, how do you intend to handle this situation in your distribution?
It seems like it will be a problem we'll all share, especially if it
gets worse in future.

Nixpkgs discussion:
https://github.com/NixOS/nixpkgs/issues/213862#issuecomment-1542887001

--tml4et7uaqyawpg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmRctQ8ACgkQ+dvtSFmy
ccAF6g/+LOzrXMqxncQ0C/oKibKcCt76c41QaL+EDa2xeOQijoSxRSbrDsHa0xa6
qWIKE+6Aagcu1RfSdRvjcsHV5dv0so3g2NQA+TULbc7pJIti56pQU4ZHcj3pHQMn
eHn6XwYfoOnXB38cHDM//N6Ojn3VxSftBB7qPxDls5WDWXRbphm5vdAvr5/mUOjM
t5tZbdEifaa9yfuNLzGfHB/bWhHzsSCAL9CS6z/g5+MgLYXgrphCvQ5rSecoqnCi
nd3dsbnV58W72G8lfYHp5DnreT6iv2Ie+H7zctTqjNM9Mjt2c9P4Rt5+/OZxr3xr
CU5scVw53VDMrH/yQGS8nM+Qo/mS8aM7cRJ9f1L6uwkWAXHfRZdZ/3ebSiVKHCoy
VjzrMuw1Psb6R0pd+9pqPtKnEmbgSrRsCcwsAKcWyL7bKZ9zRitgG3VS5dxiCJZT
22122Sj47HKaYdTrTExCDt9BYSSyBarDIWZhI4hSzSZwCWVgB0cqE25iJCrjTrfE
5WrBpZrN81CwJH2/hQsK793mmGQjz5yAOR7w734aOpJ3ei1K2NKMWwNwdleStBl3
uNXWDz0FeKe4+l8IifhgHg1G0i62287lNQumHkKPXcGfA+9LxbiivHEa/e9HPtoY
aT27bfSUYR5oadhVb3dfbtj01hwoXTvkMhMaMFqbiHfDhOB8sX8=
=5893
-----END PGP SIGNATURE-----

--tml4et7uaqyawpg6--
