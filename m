Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373EE34CFDC
	for <distributions@lists.linux.dev>; Wed,  4 Mar 2026 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668282; cv=none; b=WFdHKH2NkEAAtvQDKhliTToN93v/8JqFhv4DAf5LYIn3H6uxKwXQWWuO7rZVY7GjnfBZ4sdbRDHbDzK2s4CSZakezd3BCDgcTqeofLbJ5g7yntDgLS5s4/qGolUODCnKcpIRB8JJM7VaHvnYb09Aljo85Hq2oJTS01yU2QI/N7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668282; c=relaxed/simple;
	bh=4/bTVMsI3ORkhX5yI4QbMEm1WzAJZh+5OBME/gHa81k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APV+2rShaOMpZtDkt6UnBUwi9m5wRk//D1tjXdSWPwUMBfz2vkvF+qrhXXKGYQtrJhxNundgw6ywtPzPyiEEg6nSlhqLb5esp58Y5IpCQyTeI6GEmz6XusidH29JyfF7QoPtc6H8SX58TeAd+5ny6HAd57zB1A2XnZF0pCOBqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=K0zhKe1W; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="K0zhKe1W"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5069b3e0c66so114254501cf.1
        for <distributions@lists.linux.dev>; Wed, 04 Mar 2026 15:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1772668280; x=1773273080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/PUZQyxnBxeP0kOuUP5v4YMwngLOQhYZH06+zh3eY8=;
        b=K0zhKe1WegevxkUCE4Ko/CUX3PXn7mHmsNFnwjIteMXds5g7B/+6qFCgMTotKBi4W8
         OKnHtX4RN3g/2DzEkScIxuXBFDj63Q82fcTqG/fLRreT64a25nSpW8TNi/jbCJNThJei
         KP5U9sFCiUC1LSk7/h/eaFEJ/4jdqMkIOKX1m//xE/3vKR7XHT5T2cSfgFH46U8MDbMI
         CZgSq486Ypzk8y39JyCKRReGSeuGqh5z3QsYSgzgPsVshX7Z1MyTHA1dbm5n3apLivtO
         WccuwpDbls+eiy8iQjGxw7bQvBEYfL95bEP+Z7fxyCRpdJk4sl5UsX4F9ByfldOJb5M+
         +aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668280; x=1773273080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/PUZQyxnBxeP0kOuUP5v4YMwngLOQhYZH06+zh3eY8=;
        b=X3QgJ9+mGJ0AnX/AxnKuTlfqLILl7OWsilN3XCMqjk3RAZtcx+JVOR7/H5vISMCcqq
         fwSGbi5DFKPHfgmhwsy9xffcWDJkNHWy6uWU7PTqKQBUw/nAefBUgTJWqjvFxqHLMJ4K
         GjxZ4PcNB4xquyYQK8B2giGxpM4Dt0ZEMWx264HhXsMMvJtX+75n9oeq5gts9yXb5rAh
         rZNPl/x7R9Mh65bqxMDRloHVWGIIjseJXwVkTkVRsSOXfHMvTVaeCi6Ek0zFsIkvkMEr
         mmTRQuqWs02r3IkffrnMgkKOR3iMLsG6VqV5QvaqI9IJhIc0Dn8XuS8Q3zsnPXf97inb
         9F3g==
X-Forwarded-Encrypted: i=1; AJvYcCXU6wj8rHFrNY/71cxwFwcBmfuMtu3ojs3bmNkH7HksspnwgpF/5TeCSJtwmdzaJs9XXGIF5qWTPwesbzRL@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl719IJhkUYhCb6owmbwGaGLF+jMFKIestquFFPbvuHeUehrnC
	/LVSVNC5Gx9IiDghclKrFBWKKXD1bmYN0DhHLnLWjjmDUMQSKz8i3mLbr24nGMZP9rMoiECm1Qq
	hVnMtUTg=
X-Gm-Gg: ATEYQzz8z6PuUg/JcTbZkAlum2BLCM7uXTuGtqKpLAWmcXtd7JgdP0i8LLGpF/1L4iY
	yBMW2v/htm48PIKgiRNNww0pWMDg4vpoX9fGs0omVZR5KXDpD22M9ANwH1uo2jB7vq0vOj0V073
	Gw0HZf2DtE+m3c5sdyPqWGt2Ax+mZDeQam3XwAQIrvNvh+Qbggy4S8fIDPD/wl5Pn/om1XIQYjW
	BYY1U0Xg2uqr322GftO4W60OyGzUbgpGQaNyb4JhRra35rs7gwqJJO6fXhQKeas6T+ov1DaH74b
	8pdNc9k3BHMa33mm7Hxzkary32iV6sSjYmH+/SGiGnapuVxq1aasEHKNhyqDRRIKwn5pO2g7jNK
	vz1Mxx6ZMlm2tdtTsnK3cR8PSDav5yAsiO3ohAIHgf2Ax68aSYF8/4HjMavBPMschXYMdvt+Nh5
	a6T07+zThZeUPmz5VD297ylj4+wqCcw0geYwgwkmNGl/gd4IK80Mi2KZgACXgAfA==
X-Received: by 2002:ac8:5746:0:b0:501:40b2:453d with SMTP id d75a77b69052e-508e693f6c6mr4975241cf.23.1772668279987;
        Wed, 04 Mar 2026 15:51:19 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-50744990e15sm158630141cf.10.2026.03.04.15.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:51:19 -0800 (PST)
Date: Wed, 4 Mar 2026 18:51:18 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Zack Weinberg <zack@owlfolio.org>
Cc: Autoconf <autoconf@gnu.org>, Ross Burton <Ross.Burton@arm.com>, 
	Bruno Haible <bruno@clisp.org>, Paul Eggert <eggert@cs.ucla.edu>, platform-testers@gnu.org, 
	distributions@lists.linux.dev
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Message-ID: <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>

On Tue, Mar 03, 2026 at 12:20:32PM -0500, Zack Weinberg wrote:
> The last thing I want to squeeze into autoconf 2.73 is a new autoreconf
> feature, an option --exclude that can be used to tell autoreconf not to
> run particular tools even if its heuristics say they are necessary.  We
> had a lot of problems in the past few cycles with autoreconf running
> auxiliary tools when people didn't want it to, so I'm hoping this
> provides a self-help option for future issues along those lines.

Why implement a new option for this, instead of using the existing
environment variables which have been supported by autoreconf since
2001?

For example, to skip running autoheader, you can just do:

  AUTOHEADER=: autoreconf

Cheers,
  Nick
