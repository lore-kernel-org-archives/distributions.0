Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E41990AD
	for <distributions@lists.linux.dev>; Tue, 30 Jul 2024 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328382; cv=none; b=X49dpwAZjNTXbiBFB1kRXzgeASFcx6oDL5tZKEy3kis+sx+6+tup/Uo3fAXxtbRskaiHXxAEjax5nORT0urlrq5RSqwSfkJLdsc/P608tq8iq9vJIMbM9NAnFq/jeNS0XkVHQt0hduQ6/tmIskeB6wXERJ42VYVCwN4M+F3vQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328382; c=relaxed/simple;
	bh=lfI2A2xNgFeIAIhVXkjjCME6ymPpF0CJp3LOvc8iYC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyv7acED+TLhV84QJ3GZqq5/npSlQXUIzXMCtDHzfnheqlwtNw2NQHOVVCPUTXwTGPzICOWlKsRC63KsVxgdqaTgsrFJmDIV/aIftjzh89SWjQ01AJOXhCEnBE0Zy53T13O12ZSFrGn8TyVBoTZncWIbarw1IOaAYrzV3ad8/IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2DM3lmm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2DM3lmm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc566ac769so24602435ad.1
        for <distributions@lists.linux.dev>; Tue, 30 Jul 2024 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722328380; x=1722933180; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmwiop0st7XpmKGwi+kQm4VEi0uD+BGBiTnuuw7BtbI=;
        b=W2DM3lmm38cQCa1vEQ8RG9/p5+ZHT2U5od1Gs+rRWr4PXFfUI14pZbluswq7w5WB2f
         SWZr7XG4W8CLeA7uQuoqiUaJ1iiALxiaDwNlzLa2uexSio3kIJhHkQPEqMXPSA4ZuGHN
         YdglmbFsnA6TipgnZTKdiJHv0BqwQTEBAMwGtaTY2Lwq+iidUODWRFz9Dqj46Wk4OWSa
         a8U/JlGe2D1pkYutZqSU67bKOTtNWqTwT3X8CNZO0ThzgpsbLwi+WNu0tkoXAkzWBfjw
         rbOQLMnC58TpFw8C6zGl6aYfZ/Lfn+qe3+Z4VKvGMxSQ41Q5/uqMuJ457UMupGq1vbHF
         9+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328380; x=1722933180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmwiop0st7XpmKGwi+kQm4VEi0uD+BGBiTnuuw7BtbI=;
        b=Ruidp2Rmr8fcJAiWy6d+s3ATNv/+bLVhYVYI8hhZw3qdSHHydNV7zYsS4KluzYAeXv
         SCmxfjK9kh/dS/ykuzS3JbGTkQUaq98AUszXvLCOg9FOX0TCf45efnlkm5SMyYfkB5M5
         PKt2+lzmZ6bB4iAgCOCOoZ3WAIi+z/orjxFfMc2iIuIjtlByDLctGzTBIzdpouKKYqMX
         6V8q80MMNo65hs2YTwWSUrJ2YwImQJg5Nzx0jdrYr6p3wTUj8wSrUlpfJt/sBhE9ttTs
         fwf4eMyVH/NErr+9/9mNvKv8QOi+hNkhGMJB5KHL2lR7ugeMNeiTQSyBQmY2l6czgKtW
         sc5w==
X-Gm-Message-State: AOJu0YxtyH1k7nd19vyhZJ1pV9lfQwN78ZuoQJX7Fbc6NPiNjuRDO9sW
	aOL41NzaQpaNEvIXdm/dWDc9rOMXO9g7KMUvayd0anOOBjCXMQYn
X-Google-Smtp-Source: AGHT+IFqhtj+zhNry+bl58tB2lG7PaUKEMrrvL6HAPQXrDey1nYYJr6RlHoQhyU+s9VzLl7sNYwbhw==
X-Received: by 2002:a17:902:f606:b0:1ff:493:8de1 with SMTP id d9443c01a7336-1ff04938ef9mr93082695ad.1.1722328379929;
        Tue, 30 Jul 2024 01:32:59 -0700 (PDT)
Received: from localhost ([14.191.223.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c85c70sm95837465ad.23.2024.07.30.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:32:59 -0700 (PDT)
Date: Tue, 30 Jul 2024 15:32:57 +0700
From: =?utf-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZw==?= Danh <congdanhqx@gmail.com>
To: Alan Coopersmith <alan.coopersmith@oracle.com>
Cc: distributions@lists.linux.dev
Subject: Re: obs 30.2.0 or later: double-free on exit
Message-ID: <ZqilH5VqzZNpa6rl@danh.dev>
References: <ZqNeHWDimc2VH-id@danh.dev>
 <a9f3906b-9db5-4c90-ae56-d82825eee6cc@oracle.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9f3906b-9db5-4c90-ae56-d82825eee6cc@oracle.com>

On 2024-07-26 10:41:21-0700, Alan Coopersmith <alan.coopersmith@oracle.com> wrote:
> On 7/26/24 01:28, Đoàn Trần Công Danh wrote:
> > I'm not sure if this mail should be sent to distros@
> > If yes, please help me forward it!
> 
> If you mean distros@vs.openwall.com, then no, this mail should not be sent
> there.   That mailing list is only for non-public, temporarily-embargoed
> security information to be shared a short time before it goes public.

Understood!

> But since I'm not familiar with obs-studio, I don't know if there's any
> actual security exposure here to make it on-topic for the oss-security
> mailing list.  While you've described a bug that can crash the program,
> what can an attacker do to exploit it?  What will the attacker be able
> to do that they couldn't already do?

The double-free also happens with built-in plugins, (IOW, the plugins
that must be shipped together with obs-studio).  Hence, the
double-free will happens with all installation of obs-studio.

The obs-studio is used to process and broadcast audio files, which
could be used as an attack vector, I think.

-- 
Danh
