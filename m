Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E879C8
	for <distributions@lists.linux.dev>; Thu, 16 Feb 2023 16:18:52 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id F3E6D1EA538;
	Thu, 16 Feb 2023 11:16:32 -0500 (EST)
	(envelope-from mats@wichmann.us)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=sasl; bh=LscfDOs9Z4k8
	YMHunNdAR1uAuw3ZH9aktuFWdSKzH5w=; b=tIr+LDWGX6hKkd+O1zYsWz8XrDBv
	9ZrZdMvPrw18bJ9r5dKI52vzMjxeaoNc0iMGJzyYJYh83wvPSZkXBtvc8E7EPXz+
	YMHCS+gkZFFBw6elGc6aHw3TqasjIOVQGtv1cuK2zhatAHeO00dEQA6fn110D2m9
	7jobUJBRFUZYtQI=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id EC65E1EA537;
	Thu, 16 Feb 2023 11:16:32 -0500 (EST)
	(envelope-from mats@wichmann.us)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=wichmann.us;
 h=message-id:date:mime-version:subject:to:references:from:in-reply-to:content-type:content-transfer-encoding; s=2018-07.pbsmtp; bh=LscfDOs9Z4k8YMHunNdAR1uAuw3ZH9aktuFWdSKzH5w=; b=I6TlscJ2yB7IgCTqnKEk2p+0j06hgD2mIhKOIMUOOqib8YXL1VJmTvr9fNfdT1JptLKADX7RaGe3MvQzYPkMUNwN8Mkox1nKQy6Rt+23fpZqzfyHTypoCuDpx9+uk5AodY08x8jz+EXCzpUmrkjbEKfSyLTV9yK+r4mmd/z2v5g=
Received: from [192.168.137.86] (unknown [209.188.119.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 5271C1EA530;
	Thu, 16 Feb 2023 11:16:28 -0500 (EST)
	(envelope-from mats@wichmann.us)
Message-ID: <17469f43-674c-e09a-9635-597048527113@wichmann.us>
Date: Thu, 16 Feb 2023 09:16:26 -0700
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Distributions coordination lists
Content-Language: en-US
To: Guillem Jover <guillem@debian.org>, distributions@lists.linux.dev,
 distributions@lists.freedesktop.org
References: <Y+2JYG5pYyyG1CG0@thunder.hadrons.org>
From: Mats Wichmann <mats@wichmann.us>
In-Reply-To: <Y+2JYG5pYyyG1CG0@thunder.hadrons.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Pobox-Relay-ID:
 4488E162-AE15-11ED-B60C-C2DA088D43B2-81526775!pb-smtp20.pobox.com

On 2/15/23 18:39, Guillem Jover wrote:
> Hi!
> 
> I just noticed this new distributions coordination list:
> 
>    https://subspace.kernel.org/lists.linux.dev.html
> 
> Which seems to have already close to 80 participants. Although there
> was already a list that seems had the exact same purpose at:
> 
>    https://lists.freedesktop.org/mailman/listinfo/distributions
> 
> With around 280 participants. I think it would be nice to avoid
> fragmentation for this kind of coordination efforts?

The freedesktop list has been idle for many years so I'm not sure you 
need to worry about duplication. I couldn't recall when I saw anything 
from there, a glance at the archives shows there's been one message 
since 2017 (and that was in 2018).



