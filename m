Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3585695
	for <distributions@lists.linux.dev>; Thu,  5 Mar 2026 00:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668993; cv=none; b=VGi8jj6XIWguu+PjEPccuMCtq3hOs6RjNiFFZJgMw1yfURtkkZU8npTEkre4ZLaJrcIYJqjnlCoXDmiYImJOw92Pe+umnDBxIm3B66qyP5GaGHZCs6t3Rt/3n73rODCwJyD0RK0M1OzS62yI7EvA7DAgp2frVSa7DbGGr5uR2JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668993; c=relaxed/simple;
	bh=aGW09GK5hyETrPlZEE+MupIUwA89SHVNKDo73GAC7wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi1hnxdpGKhmytnXk1w2WB16a6+HR8dcI6p12m8/91Dww+ppANHgpgNNitUxQtfMLuN265hXjHy9xBio7aO3nAT4lBU9Tksr0HnasqCURK3qVE+4nJvoAKY49V+lx6ma6jqY8osw1Zk9GJd+nggTzF/FGNGQqyt9ChFZj0wGQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=1OEvVTkN; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="1OEvVTkN"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c7199e7f79so996936885a.0
        for <distributions@lists.linux.dev>; Wed, 04 Mar 2026 16:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1772668991; x=1773273791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pc5DqWUZC33VGRN5GsDDjhRomYtwlqBmdPUItTRE+Y=;
        b=1OEvVTkNEBU3xY4RvX7l9OPHhCmG/Ed2nFBeyLcTGUhDhw12UPAdsh3x4Kz/McIISD
         ET6WusBDAkMxopGDUtklnetR/WD9/gaX+/LeD1tdxa1m/vT9U7i+Yh6FVYPTXmsl0biU
         nh5+vk1lQEQhQF+HE1X7K46O8z0lTWdm0f27GlWv3bxezAM62/D0WYaAmBk97OEPhQGB
         WzOD83Kg00ebCa02b+5gU8hFG2kCT2sNXv0iN+kkjdwmSxou7BA22KicOFGCosdVN92b
         qYRk7pzJsROpjT2vfefeZm6mufQhhBl1ewPSKNccKM1FC5YYwJVLo/FPsw3+KaACp03O
         w0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668991; x=1773273791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pc5DqWUZC33VGRN5GsDDjhRomYtwlqBmdPUItTRE+Y=;
        b=ektvqItXQcrROzaxYP3Co14EDS84+XCIc9H4mvjG6E2cGAjHZdPxcGVDIJWhup9EXr
         5g6dOQD2s1EEi11khpiII15CBtAtIPmFedRSVLeqMJZfyQGWIntLrki2CD4fyqgTK/f8
         EcYuZIFGn9wLPEz8lZD1B40XSqUs5mDFpA9CkNBa3jnWrc84SbHOel2a/FYdCcOFzDni
         ghNrD5wFIyh1r8v/bEnnOkiz1Mflt2Og6AlOCtaUoXd3sd7JihvX+zzIp5dIPbyc5qG1
         UVOC3tDE4gvNRG6MpOhlAXh2h8FCR3Pc/3Bmvi+HfHFIOdYnDZlY5ah8VZfZPe78sLJJ
         mv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWisrbG3x2Dc3HfAbQ2qMfXS5A2u04vWHh+R9YmlUXF/C8vLN88iNw/5snf1kBH+KPcBq74hDGYzPcDKceD@lists.linux.dev
X-Gm-Message-State: AOJu0YyGX5PjPPuy7UzfvQ3yoOu36jAxRHo5np2qWn5R8HZXzaGl92Cc
	ZHhJ2xAhvWprZ/vS6zr4Ig7LQXuM1U9z0AYnmGqZnrlQjzyNGEVQmVrzcrUYaBwf7YJMdhluIN9
	TuLgXa1U=
X-Gm-Gg: ATEYQzxgW1fUFnrxqg6eLmNWKqT85MJ1yfn/Qzt/MTxj+HsoMN06sco8YYdv2wxBPb2
	sEqY2bdm/0VD6IxrP0pNH4HR6xd/3W8K1RWCTXSmjgoIWiPdvMVcldy+n3tXGzRPNDMk2asVEuN
	Yj2TM0LqaO5ns0xmiFN1FI8AMEE9nIkzE+Zhrfps7c+3w8POAhieM4Py43NTA+tFWitR6fDvYIW
	GZcMcBll76VhxgrrEZR65j2phsOE8jH8gjT7rn2pHOqTPBLoLZryFXcWVh3cEeovvU7c0dDI8I/
	lDbMUf65Gw80ktsGcLnyNCQkuwZhSWa20F9Tj0QHomhdnp2fXUzn8Kh+iZpUQpTByGrLcFR9N98
	WhNuLp4409MWwjIVXso0lvboZEaaMAuCOlFqFD+F5wRJl52uXNctamu80Rg2mYJ2gfON9pyZM4W
	X0FJZ+hOnvLuojx5f5oLYJ4uGHXY85NJQ7FkfJ2Lhkx7DY2cpzOw0TktUbH7ScAg==
X-Received: by 2002:a05:620a:4152:b0:8ca:2cfa:822e with SMTP id af79cd13be357-8cd5afaa585mr501013585a.70.1772668991240;
        Wed, 04 Mar 2026 16:03:11 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8cbbf717301sm1722564685a.36.2026.03.04.16.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:03:10 -0800 (PST)
Date: Wed, 4 Mar 2026 19:03:09 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Zack Weinberg <zack@owlfolio.org>
Cc: Autoconf <autoconf@gnu.org>, Ross Burton <Ross.Burton@arm.com>, 
	Bruno Haible <bruno@clisp.org>, Paul Eggert <eggert@cs.ucla.edu>, platform-testers@gnu.org, 
	distributions@lists.linux.dev
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Message-ID: <atc7bitk3qvs33z3j6m5qgv7e7ybqt5w4oycbaa4wllvriop3c@wl4e2nallylx>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>

On Wed, Mar 04, 2026 at 06:51:18PM -0500, Nick Bowler wrote:
> On Tue, Mar 03, 2026 at 12:20:32PM -0500, Zack Weinberg wrote:
> > The last thing I want to squeeze into autoconf 2.73 is a new autoreconf
> > feature, an option --exclude that can be used to tell autoreconf not to
> > run particular tools even if its heuristics say they are necessary.  We
> > had a lot of problems in the past few cycles with autoreconf running
> > auxiliary tools when people didn't want it to, so I'm hoping this
> > provides a self-help option for future issues along those lines.
> 
> Why implement a new option for this, instead of using the existing
> environment variables which have been supported by autoreconf since
> 2001?
> 
> For example, to skip running autoheader, you can just do:
> 
>   AUTOHEADER=: autoreconf

I guess it has to be AUTOHEADER=true but you get the idea.

Cheers,
  Nick
