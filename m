Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C977528C2DD
	for <distributions@lists.linux.dev>; Mon,  9 Mar 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080341; cv=none; b=MFdf0snw+t66+JROzcQV1ENynVtMFz0ojFdvVz5uIMuE1eDNJPWC6Ob+UUAt5VHKfqVlph136i8MpIUWLSs7e3gweeSFQBM7+72pHpoRjarI3aDrXosaaf+8ZMWki0dM948tRHSYitnhVUJGZf3VpHYq6VnG3pKAErnbf0UrmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080341; c=relaxed/simple;
	bh=EvSZyNo0Thr+zNw22RJJXlNJSLwY7hz73T/nuG4qIh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeeZCWnOW1qMjZv8HD3Xdmx2aUVJ/bOu4AkYmW1Al9n13d51O7FT+wm+uhNsvBlp5spum67YBk/FYGPEqx1Mq1r3/v/JlILEoFHzr5YJmuz48/1G9DfKfZ9WF7zEePV4c6gxHg4Kx60p3veDFz751avTq5q4KxRwVFZzSd54s9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=x/s97NMo; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="x/s97NMo"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-899a5db525cso110875896d6.3
        for <distributions@lists.linux.dev>; Mon, 09 Mar 2026 11:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1773080339; x=1773685139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ChqGa8Ki+kQi5FoQfP0fMVhj7la75KvQ3RIWdXjkTF0=;
        b=x/s97NMoclFLeJyNuqnk1zdJkvZWTmw/zK4T1PPTDOoqR9pe215EL5Jrk4+ruqB7fi
         wZnNuiKH4VaSBXd68I9BhdOVmuu9pPwIY9T19kFT6MFl8nxV7P6vTu0B1Y9x1FFLYXO5
         ZHsbLWyBiPfPjekPd2of+9sphtkgQMaknlUq878GdvzcIyhekvQHQDDLoTuJ+dtEwg+g
         IxKJJ+tJhk/mfraQZ+SuNhzptD0OMdJL3AhATcYIFJHKbdF+UDCHqykoV2bJj5+AXlAY
         uHAG/TZUHlpc5rKKHjNxeSQ5IRWx5v0RIpgbmY8HPT5KQm7yZ5gTpSCo06VJ1RSBQpAi
         Ab8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080339; x=1773685139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChqGa8Ki+kQi5FoQfP0fMVhj7la75KvQ3RIWdXjkTF0=;
        b=WZs8buG1XO4FjJehUthaLWaMVizugUXR6M410f1Pn4l4iwxisTKNtL4UmjmcQunmjP
         kW5ybgqaCFa7jby/zz/sZ+aKCwLNV8Fb7OkfP46l1eJY86/Q+V/mDM9wI8kX+TGD56w3
         Qv0h3ioQQC9iYSQomIMlOyipy3T/NKVbHLRhT86LL41C51n/qM2Q5SMaP1X52kI/sGt7
         QG9ZiQkSl7DnfqZC2hMI6DXKdzkiOB5ttmVXnPr6Nhf+bsYGT7OKpDyemfvE1j79OeHe
         cDZ+0iVGtuWiRunIS//fjfN4REUj17mmljGTXkSZRSGRHnVazhVaovC+J+v8qGGJMsZk
         FYDA==
X-Forwarded-Encrypted: i=1; AJvYcCVr7ktHhRQSNay6ZPcGnoj1paTjcLm+pcyOMhgw4WJWQ23COn8B8kgzfFAN2orzNLzV4XjkaA8tOYwvScd+@lists.linux.dev
X-Gm-Message-State: AOJu0YzxnuLJ5Uf1LSZBbcn48Ikcp7Dw/JxcMrcJQ7qs4uMdvBXTij/H
	hecdoyCEWJOVFt+LigNXB3nJTGdWbqvpcevFds4wtRUn4CSLNAM3aenzIwAi6NC5Fo8=
X-Gm-Gg: ATEYQzxFaS9l1BeAMH7zSrcrB0F/d1yBhiUv1/QTOLZR8AVT6pNc/IyHnHjDoGQ9R4g
	ZRGLRAltg3BkX1ExHatFfGb/Zv2BZaVTkQSZkAcdRvcgMFSCviukyF/5rM/eCK/5sK6SFIsCKL1
	LMY/hgPMtQEDk5F9IIIPta1JlOnFTNF1dUDW2iFDGDEDtvszjGKdrQ8zeIUy3NiN1fUIiNnv+I4
	3BPR81drqXQPy+lWXSujxLyWA81va9/5jveCPBbrx6PU6cUa3HysJlIJOMqsD9Hr1DAe2ml0RZ4
	9mBOAHJSPwJ/SaU8j5F/hoNZqS5hxN6Gxab8VNBX6M/t0mKdZlG5FME1il5DxA8f3GispBIj61A
	C0uIQb+a56IA7y1qUVadVdd4GRyfvHrwDl3Gns++j+/+nbm0ohFWDiX42MPAiw1Q25vth4RDm6+
	DZFJyNK2TfrAwRk6f0bbdqFN5TXy0fNapQgk+TawNfF1xbhkHX1pU=
X-Received: by 2002:a05:6214:f07:b0:899:f829:e8b9 with SMTP id 6a1803df08f44-89a30a36e41mr172329466d6.23.1773080338355;
        Mon, 09 Mar 2026 11:18:58 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-89a57a18315sm3142216d6.6.2026.03.09.11.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:18:58 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:18:56 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Zack Weinberg <zack@owlfolio.org>
Cc: Autoconf <autoconf@gnu.org>, platform-testers@gnu.org, 
	distributions@lists.linux.dev
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Message-ID: <k655rugxzjvt4tb5o3kc2zos6l7oz3ooqbfuw5j7yl2ls7miud@d7x637tpydpa>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
 <eb9f5c99-4b8f-43c1-b527-60200265352c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb9f5c99-4b8f-43c1-b527-60200265352c@app.fastmail.com>

On Mon, Mar 09, 2026 at 01:14:38PM -0400, Zack Weinberg wrote:
> On Wed, Mar 4, 2026, at 6:51 PM, Nick Bowler wrote:
> > Why implement a new option for this, instead of using the existing
> > environment variables which have been supported by autoreconf
> > since 2001?
> 
> Discoverability.  If someone's having a problem with autoreconf running
> something it shouldn't, and they look at autoreconf --help, the --exclude
> option will be right there.  The --help text does also mention the
> environment variables, but they're described as a way to control *what
> command* is run - like, in case you have autopoint somewhere off the default
> path - not as a way to control *whether* the commands are run.

I do think the sentence in the Autoconf manual is better than the
sentence in the autoreconf --help text, because it actually says
what the variables are for:

   The environment variables AUTOM4TE, AUTOCONF, AUTOHEADER, AUTOMAKE,
   ACLOCAL, AUTOPOINT, LIBTOOLIZE, INTLTOOLIZE, GTKDOCIZE, M4, and MAKE
   may be used to override the invocation of the respective tools.

Surely it does not need to be explained that the ability to choose
the command which is run also includes the ability to choose a command
which does nothing.

In my opinion having two different, documented methods to achieve
exactly the same result just makes things harder to explain, not
easier, especially when we're talking about a duplicating a feature
that autoreconf has already had for a quarter of a century.

Cheers,
  Nick
