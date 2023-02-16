Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2FD31D
	for <distributions@lists.linux.dev>; Thu, 16 Feb 2023 06:22:32 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso5483371pju.0
        for <distributions@lists.linux.dev>; Wed, 15 Feb 2023 22:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=footclan-ninja.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq3ZQOna8oChsjw4OI63NanrMcnzwhoDcttDUDdShKk=;
        b=tu6S3aokwsTf0NS9G/owr9LSRxzYpHg1wG+Q4IHswryHtDQoVB0LlC/9LznoEwGb8R
         SSazehHY8VcHGLvMMK7wcx35J70y97nvK69/2DeRN4fce/9q/eVAk+ndiC6egnOlaAdO
         UboJLzd7VcqJupsCFKUzhoiHKo+xnvyqed9XmsVyM5axVmsETGkzW1QrmOq06m0u5gDR
         ZY9Yy2kx59pvRXo15WE4K5L3WBjiu5DDyHqyLYvkH6esHsyy7sJ0GQDStdmtH40ZigL/
         frXwQLXVrWP7VtxRpp5qL5eZS94Z6Ky6JSdNAYKAc3Sb+UWXK4Oi9FrKJ+gph4dbqtPv
         2APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sq3ZQOna8oChsjw4OI63NanrMcnzwhoDcttDUDdShKk=;
        b=vZqh2Rnz/ACQlf6q/eYC/wPPkeNG25aidL2+eyEPfbaXXuHOfILjEB51C5v9Fy4nmn
         ZjtOGow09aK6A760jk8j7zNOIdACMce2NEtBscIX3StLMAvwwPKwXBRotR+5/9bTGLlK
         FUZU9zLHcF5DfZSNtmbaYwcL9KZhF8+0zKqA30vDKzl1AC+MRWOyxL4LpISAcJSgn8Ao
         z3xo9lslwto5IWZ/6yEJGuOMTE7eDhtSI0ZLEZCWpImUvnguCwoFP+ema7Q81BnQsVN0
         IDelZfpbpJ3Is5GHJTx0Fquy+pZODZU6FeghKf549lSWUUl6/QqBTm9APHBYQ1HmtKxI
         qNwQ==
X-Gm-Message-State: AO0yUKVMgCv2akRE/EifHvO6fYlSvSlLDFLTtRGSEI41dUBknioYx3yH
	zcnQxc5iSrduKLLxkdzgt6Xayknh4QnJqoRDuTWh0jg6bLupDAQkybzaJr5D8y9mewSNKbkr5pS
	WohV5bum/YTCg68Vsgd3xNh/+o+cSIJ81hucKJdGBoN7YFn9OW1Qnc0uX0xbEy0UzGclrzGwUUN
	cKzONtaqAXnph2nAMW
X-Google-Smtp-Source: AK7set8bOe79mTr0JwWu1fdPCSzW+0CAW0lZkyh9JWJi8jJpE4sgrjO3+vqxygjHc480bIkvq+Fkgw==
X-Received: by 2002:a05:6a20:7d8c:b0:bc:bf86:660 with SMTP id v12-20020a056a207d8c00b000bcbf860660mr5742419pzj.45.1676528551531;
        Wed, 15 Feb 2023 22:22:31 -0800 (PST)
Received: from ?IPV6:2403:5808:2e:4::1192? (2403-5808-2e-4--1192.ip6.aussiebb.net. [2403:5808:2e:4::1192])
        by smtp.gmail.com with ESMTPSA id q19-20020a62ae13000000b0058e12658485sm426448pff.94.2023.02.15.22.22.30
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 22:22:31 -0800 (PST)
Message-ID: <e3306ab8-3656-3128-40f8-f76e6871a3a3@footclan.ninja>
Date: Thu, 16 Feb 2023 17:22:27 +1100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: distributions@lists.linux.dev
Content-Language: en-US
From: Matt Jolly <Matt.Jolly@footclan.ninja>
Subject: cURL 7.88.0 HTTP/2 breakage
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

We've had to mask cURL 7.88.0 in Gentoo (and I note Arch and Alpine have taken similar action)
due to a commit that causes broken HTTP/2 transfers impacting things like `cargo fetch`.

https://github.com/curl/curl/issues/10525
https://github.com/alpinelinux/aports/commit/ed89ad7059e2ccf3d5bd9cd7bbde506ccc0bf6d8
https://github.com/gentoo/gentoo/commit/1a9121ddab7ce24b861ff6f1d6c00539d30afa30

Nothing much to say about it otherwise, PRs awaiting upstream; it may be best to revert the offending commit
or wait for a new patch release if you're looking at updating cURL packages.

Cheers,

Matt

