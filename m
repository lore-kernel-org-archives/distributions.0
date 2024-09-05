Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00B846542
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551263; cv=none; b=FVPDb9nnoKYHReyHj47R5bWY5MqJGa4oydypKfXIf3z4cmn+qxvtFrCd9PKQcS8P/yPzCYgXzcbsijJceURz/KqosX9zcD7KxBqkmwFIGpm3oIqSfNr25i/c4Qt0JM8NDTzQpsMDQX1bbVGgImQoSGkDQ1HzdRbmhQ0Fpi4gu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551263; c=relaxed/simple;
	bh=DQRVdL8HC/3IWL4Oo4I8BYFRh7BsXGfpyigns/5/NBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la57X18/fV5SGAqDBD9HtAzpBRMWqE1ucmUW7ni79wAsi6RK8wjg8gN05hiafeSCo7SNMG4GFZv3Y17ZabeDwtnFHy/Pqpn+Ba74RtZe4ekHHcwdZDA/mKTFN+iSHavjMBocOW/hAB2OgZl4OMNrGbkKoXdci/5XciSnPOmMt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=VUUGcKgw; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="VUUGcKgw"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 8DAD13C011BDE;
	Thu,  5 Sep 2024 08:39:29 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id 76JHmw798sqv; Thu,  5 Sep 2024 08:39:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 286AF3C021911;
	Thu,  5 Sep 2024 08:39:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 286AF3C021911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1725550769;
	bh=pl5If79YamSWrTPzS8p+QGhL6k8c7BRd51sItbH8pPA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=VUUGcKgwiZ0vM6IEe+UZIj7WWKrMqhKU8LTWIiiYTo0wlemNiAzAwT2gfUMSnY4Ny
	 iXsb6bqyjbuyDMhtkwCoN8YyYBMskVVz27W6sME0QVsWrP6gYAFUauIicZ1QOJobBp
	 o0RdCjHVZj/tcibklDdN1W3WMWyGzyCCaVX8ZwK8KZcpopxRxmLex/d0jG6HMtOGQ3
	 MyCt/tRfLMzEysbZCm9fgZ959svwTy0R37aKwEyaXAzNDrPE6ixc4RVPp0xn6ucwLX
	 WRQHYHvSrLrmJJKFGJkM9+p8s1K83CQq/yUX2DAtuodg3A4jWnplB1jVe0uT0buiIv
	 FQCWfWrEPk27Q==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id fzirkIl8sZGA; Thu,  5 Sep 2024 08:39:29 -0700 (PDT)
Received: from [192.168.254.12] (unknown [47.150.137.250])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id E2F493C011BDE;
	Thu,  5 Sep 2024 08:39:28 -0700 (PDT)
Message-ID: <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
Date: Thu, 5 Sep 2024 08:39:28 -0700
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposed CHOST change for the 64bit time_t transition
To: "Andreas K. Huettel" <dilfridge@gentoo.org>, Wookey
 <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
References: <4996568.GXAFRqVoOG@noumea>
 <20240905020617.GZ23787@mail.wookware.org>
 <CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com>
 <3848277.MHq7AAxBmi@noumea>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
In-Reply-To: <3848277.MHq7AAxBmi@noumea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

One possible improvement would be to append "t32" if you want 32-bit 
time_t, instead of appending "t64" for 64-bit time_t. That way, people 
wouldn't be stuck with appending that confusing "t64" for the 
foreseeable future, and only specialists concerned with 32-bit time_t 
would need to know about the issue.

Personally, I hope backward-compatibility concerns don't require this 
sort of thing. I'd rather just switch, as Debian has.

I felt the same way about the 64-bit off_t back in the 1990s. It was 
obvious to me even at the time that we would have been significantly 
better off making off_t 64-bit, while keeping 32-bit off_t in the ABI 
for backward compatibility; this is what NetBSD did with time_t in 2012. 
Although I realize others felt differently, I never fully understood 
their concerns.

And here I am, three decades later, still having to make changes[1] to 
Autoconf's AC_SYS_LARGEFILE macro to continue to support that 
30-year-old off_t mistake, and now with 64-bit time_t interacting with 
64-off_t in non-orthogonal ways.

[1]: 
https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=b71143738516017f0e0d347a4025301c06c40254
