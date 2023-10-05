Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA01170F
	for <distributions@lists.linux.dev>; Thu,  5 Oct 2023 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etXcsPer"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso836795b3a.1
        for <distributions@lists.linux.dev>; Thu, 05 Oct 2023 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696512791; x=1697117591; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRU2kO9hK6Q5UDjEKKwgpZWfHnKVVG/UEAbZVM3i8sY=;
        b=etXcsPerWDErdJn9sJSeJsAfBzrqoUbZyk+0q9BFmwDhD4gg/y2p1XP3mVL0ysmm3v
         X2bI+xX8JUuN5SV3mhXugv+wTSxSRJGJKPNaMniwG5IMj7N541k6Mp3SzWLfFxEzrGLa
         pxneUexugBmYuKfr/AkM6unFozxn+RVbe8JOQKaogXFtqj55ozlgCdN6qCOkqSNwLnJ3
         Yp/cl2Z5pfB2yl1zZbsJyq+9h1udutLB9HfWkTfvcPlRU2v/MXLrypVx9uxxGD2lUb/Y
         6scqNyMY/jvin3D8BGVOgdBcCQvvBNLtwvPPB4hjzz9ipycnUX6zG0sayNCaaDrn0XVj
         2xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696512791; x=1697117591;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRU2kO9hK6Q5UDjEKKwgpZWfHnKVVG/UEAbZVM3i8sY=;
        b=tXVzI0uGpk0GoT+YpYz8NE81i6eDoZGcx19Cpz0HdEqm5mgARb480CaedstQOIIQwW
         YnJXbhmjSTyv8gu6/Z6Us/GfOv0wSGkiea8TA3SobnmG9eDkf1s3BNQ+OdrZ5HWvZdsq
         y6/W1B5M9kWNuX3uhbp59lILjVB6z0hXDCc/WJAaOCiwap+9Dsq7788KUSBu/wBoH21U
         SAiAZ9Spz2cQz7yQSjW3W2hOl68PzevfFpNo4haaNjMpMS+Hr7OBy8G03TD2zkAc5KBC
         mMc7OdbhtuXF3PGVXXB5hmwAJ8nkz8O+ToI+F0sVwBuroSwC8iGDnkrHC+JAc6465PeJ
         FDbg==
X-Gm-Message-State: AOJu0Yx3UGPy7lR7HxbVxidiLmb8R0r4ui7/I2WSv+bWD77HyalEWXtc
	KXDMuOqDKyx6StLDhUAEtUs+JxLzELU=
X-Google-Smtp-Source: AGHT+IGqsPdH7+g9iUznV9JhniVy6rkT3EhSXeLNJY6We73UXxynF91EzdZ0pTNO6TCq3A66nWebQg==
X-Received: by 2002:a05:6a00:9a9:b0:68e:3bc7:3101 with SMTP id u41-20020a056a0009a900b0068e3bc73101mr5860324pfg.2.1696512790782;
        Thu, 05 Oct 2023 06:33:10 -0700 (PDT)
Received: from localhost ([14.191.217.209])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b0068c0fcb40d3sm1344971pfn.211.2023.10.05.06.33.09
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:33:10 -0700 (PDT)
Date: Thu, 5 Oct 2023 20:33:07 +0700
From: =?utf-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZw==?= Danh <congdanhqx@gmail.com>
To: distributions@lists.linux.dev
Subject: There is a curl "severity HIGH security problem" pre-announcement on
 GitHub
Message-ID: <ZR67E4b66iaJYiRy@danh.dev>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

----- Forwarded message from Erik Auerswald <auerswal@unix-ag.uni-kl.de> -----

From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
Subject: [oss-security] There is a curl "severity HIGH security problem" pre-announcement on GitHub
Date: Thu, 5 Oct 2023 10:14:49 +0200
To: oss-security@lists.openwall.com
Authentication-Results: mx.google.com;       spf=pass (google.com: domain of oss-security-return-29213-congdanhqx=gmail.com@lists.openwall.com designates 193.110.157.125 as
	permitted sender) smtp.mailfrom="oss-security-return-29213-congdanhqx=gmail.com@lists.openwall.com"
List-ID: <oss-security.lists.openwall.com>
Message-ID: <20231005081449.GA20205@unix-ag.uni-kl.de>
Content-Type: text/plain; charset=us-ascii

Hi,

there is a pre-announcement of a curl security problem with high severity
that can be found on GitHub:

 - https://github.com/curl/curl/discussions
 - https://github.com/curl/curl/discussions/12026

(I have seen a link to it from some web site, and did not see it on this
list yet.)

There is little information available, the GitHub discussions post says:

   "We are cutting the release cycle short and will release curl 8.4.0 on
    October 11, including fixes for a severity HIGH CVE and one severity
    LOW. The one rated HIGH is probably the worst curl security flaw in
    a long time.

    The new version and details about the two CVEs will be published
    around 06:00 UTC on the release day.

    * CVE-2023-38545: severity HIGH (affects both libcurl and the curl tool)
    * CVE-2023-38546: severity LOW (affects libcurl only, not the tool)

    Now you know. Plan accordingly."

Best regards,
Erik

----- End forwarded message -----

-- 
Danh
