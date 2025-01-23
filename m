Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2C3DBB6
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648789; cv=none; b=epCH1mZLNXOT5o3bwI5gtvIBS4GX/fu5LM40JW7dn38fCb8uedq3slrMlFb6hOZ5yf9iW7kusXgTQshOsBhp8mGGkHavfCCdipsNfkUi6Mqi2Y7vX59RL4++TNfmRfqTWq3nr2zo6QoniKeAb0cI/KQnOkeaRirS4Otf5BYptEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648789; c=relaxed/simple;
	bh=BUCemFYgK2AHeFGgKyQ1NJZEPdm4mJeqDLeOGew0220=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lgXXnv3Yg0U4QPteKFnYJBL9kBicl/zApk3yf+nVe8e7DtLqkVAocihSoG7dMBXReDakIrcteIAeOyGaY1tT/t3SsVmWXNphQxRPoQ9Ng7OS5IrSDPRQ0qYzSRPxGK58yJ+NxyfT4GOixDSuQ/otB8/PVcwb6GVQKKCRGArgbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name; spf=pass smtp.mailfrom=coelacanthus.name; dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b=hTy8Loyy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xAWXcNQ5; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coelacanthus.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coelacanthus.name header.i=@coelacanthus.name header.b="hTy8Loyy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xAWXcNQ5"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 091402540139;
	Thu, 23 Jan 2025 11:13:06 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 23 Jan 2025 11:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1737648785; x=1737735185; bh=M1zrdEfRaob6RMU+mtwZ/
	SSILSAxUhGXqkOPw3LpaiM=; b=hTy8Loyyt7rjXEs/TmiADPpWjvvqRALXrk+KE
	e4C5DnyRHNy290Y7hK0G0pHcgznTvGIwUDeqj++Y2GjMBNy656KC0HxSRWSdTcyi
	dZQy7iuZ4xl86zlJ7z6vzdw5CqFnuNORKqDV2x1UhOy1xJjC8d/WmNG3y6uET1a2
	BN7+S5/E1FeWvHN90fuFrz6ciysysrCSCC256nKoXaGZ4+IU6U2DCkXJpRPHSRDA
	OZeVrV2s09AiKEmVE0jQb8GdY3zKd5kfBiA8r905Au4E9gJIgcBUojjXWzgxlPcK
	dcNRUsmOEQCJEG3x+k9GrUNLihEU5vtwd/mf4SYKtwwy/kJ+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737648785; x=1737735185; bh=M
	1zrdEfRaob6RMU+mtwZ/SSILSAxUhGXqkOPw3LpaiM=; b=xAWXcNQ5pPtkgxE3q
	uJyf0jgWOEtxDM2344UYU78YtULyVCHs/FPmFf2Z8jWl74TRdc7vSK1dPAgq9ea6
	Ed/9buwh6vLcr66A407OOtNmwoMx1Bm7pzEcenXmVOlxLonNHzq3DOZcSxcfAyz+
	uEaTKrkAv2wVx4D1QGXAqFOVHWnNavIwgNBdka+1/sDSd6efTRc+enRZhpmRASRk
	h69RDYCODqCqpNSxGizw3uxBU/3XM5dSwjSu4c25pOQZVI23MQzTp51JaxNdKW3K
	TgLp/JCxWvRqlBnbbOGu6/+QnmbpYfo0Zs3q7ZoWzQtF/NRqi5c3vGXzv9vY6LI/
	rpl4g==
X-ME-Sender: <xms:kWqSZ3vpsahBoSbV9D7A9bPX_Gl9KPqrbFtfapfUXL6Ixz6FaI6Ang>
    <xme:kWqSZ4cH39pOUkhiHC6FI_mWFP_f_mZs3CO80Di4WJI6G4YQlo171XM9B5XP2wD71
    EEd_VVKdnqE8LMSWgQ>
X-ME-Received: <xmr:kWqSZ6zWjYt8RNpTqWr4kNX_VkLLtVsu3ZY9NT8QK5RR2H4H2o05JwhTWFb3s-aM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdej
    necuhfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuh
    hsrdhnrghmvgeqnecuggftrfgrthhtvghrnhepteduffektddufeefudegieetkeejtdev
    kefgheevueekfeetgedttddtleetudfhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuhifuhestghovghlrggtrghnthhhuhhsrdhnrghmvgdp
    nhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhgoh
    hrnhihsehgvghnthhoohdrohhrghdprhgtphhtthhopeguihhsthhrihgsuhhtihhonhhs
    sehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:kWqSZ2Nbti0A343LNMS2IOR86BMAX0wY_8oVH1x24oe8bB6LhJ3lRw>
    <xmx:kWqSZ3-fR6IL-QqOIMCLbfdQ4l0yoqtyVQZ0RpMTTEnQbzl-wtNsmw>
    <xmx:kWqSZ2WfxR3YI-cS-ypkQjhMQN8VwUcFHIfzH2T1zhLmfBpkXURXhw>
    <xmx:kWqSZ4ctEzSkTUpg3jGhs_r_w8-S5r1GqZUnzUj_3WcaOjKdryINdw>
    <xmx:kWqSZ5J9cRICi184CinuOp9f06EGpBZKvQgC3vmoS9_lJ6UaQwLUjwSI>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 11:13:04 -0500 (EST)
Message-ID: <c6b89c4a-9056-4e88-8bd8-7893b1181438@coelacanthus.name>
Date: Fri, 24 Jan 2025 00:13:01 +0800
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
Content-Language: en-GB-large
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
 <20250123151916.476793-2-uwu@coelacanthus.name>
 <3fcbe4eccdb6b6a3ca966ef935261be29f54cb45.camel@gentoo.org>
From: Celeste Liu <uwu@coelacanthus.name>
In-Reply-To: <3fcbe4eccdb6b6a3ca966ef935261be29f54cb45.camel@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-01-23 23:38, Michał Górny wrote:
> On Thu, 2025-01-23 at 23:19 +0800, Celeste Liu wrote:
>> On 2025-01-23 21:14, Michał Górny wrote:
>>> 1) NO_NETWORK -- if it's set to a non-empty value, it requests that
>>> programs don't access the (TCP/IP) network.
>>
>> It may be better to be named NO_INTERNET. Network is a confusing word in Linux 
>> world. They can refer to something from only Internet to any protocols in 
>> network subsystem, even include AF_NETLINK... I have been asked why my udev is 
>> broken when my program is in a netns many times. Systemd also have to inform 
>> this point in their document of PrivateNetwork. So use more limited word 
>> Internet to avoid this.
> 
> To be honest, I've been trying to follow the term I've subjectively
> judged to be the most common.  Some projects also use "socket".
> 
> On the other hand, as network namespacing shows, this isn't really
> limited to Internet — we also want to cut stuff from accessing services
> on local network as well.

Yeah. I normal think isolation with Internet and isolation with other parts of 
the same OS are two parts. So I will get confused.

> 
>>>
>>> 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests that
>>> the build system does not use any vendored dependency for which it
>>> supports using a system version instead, and that it links to shared
>>> libraries whenever possible.
>>> […]
>>
>> Some build system (e.g. Meson) have infrastructure of switch between system 
>> library and vendor library, it's good, we only need to expose the switch via 
>> environment variable.
>>
>> But in many build system, especially in "modern" build system like Go, Cargo 
>> (Rust) and NPM (Node.js), they are not good on this infrastructure:
>>
>> Cargo users normally use feature gate to control whether use system library, but 
>> the gate name and the gate direction are not standardized, someone use 
>> 'vendored-xxx' and some others use 'system-xxx', and in Cargo we can only 
>> control the package behavior we faced directly, not indirect dependencies. if we 
>> want to control the bahavior of dependencies, the only way is hoping ALL the 
>> package author make a feature gate to pass this switch to its dependency.
> 
> Well, I have some Cargo experience, so I'm going to focus on this.
> In my experience, feature-gating is not the only way this is done.  Some
> packages (e.g. zstd-sys) use custom environment variables instead. 
> Others just default to using a system library, with fallback to vendored
> version.
> 
>> In NPM, the situation is even worse. NPM ecosystem prefer to bundle everything. 
>> They have a --build-from-source in node-gyp, but not all package use it and it 
>> only affect the library that will be load by nodejs. In fact, many nodejs 
>> packages, especially which have some web contents, may download a copy of 
>> chromium. The switch for it is not standardized and even not existed in some 
>> projects.
>>
>> For Golang, it doesn't have any infrastructure for switch. Their library is like 
>> an union: either use system library or use vendored version.
>>
>> So the first step may be to build a basic standardized way to use system 
>> resources (include link library and use some executable files) in these language 
>> and build system's ecosystem.
> 
> I am thinking of this proposal as a prelude to that.  What I really
> would like to achieve here is to set some standard variable names, so we
> could work on individual ecosystems and build systems with standards to
> back that work.  In other words, I'd like to avoid having every package
> come up with their own custom ways of doing this — and I'm worried that
> if there's no "standard" behind my effort, different projects will be
> more likely to choose their own variable names (say, NO_INTERNET vs.
> NO_NETWORK vs. DISABLE_INTERNET…), or go for project-local variable
> (FROBNICATE_NO_NETWORK).

I mean that we needn't to inform every projects to make 
NO_NETWORK/USE_SYSTEM_DEPS were used, we just co-work with the build system 
develop team, help them unify the way to use system resources and access network 
in their build system ecosystem, and finally add NO_NETWORK/USE_SYSTEM_DEPS as
a way to control behaviors. i.e. I think it's better to make the build system
become the situation of Meson first, and then add NO_NETWORK/USE_SYSTEM_DEPS
to them. The project developers just treat it as a good new feature of build
system, needn't think the reason and internal implementation too much. The
build system developers do what they are good at (improve the build tool). 
The distro maintainers needn't to communite every projects maintainers. 
The project developers needn't to implement the dependencies handling by
themselves. Everyone will be happy.
