Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87904176AB6
	for <distributions@lists.linux.dev>; Fri, 26 Jul 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721982498; cv=none; b=A9Ncr/HYEDigSoHP1c8o6aw41K+HI0xOG4gri6BjGy6xmzvPVCvT/EbndVvGYlSNTU4wEAqRD8zGvq19O9tKMZ3DDlU2QlJAjPFeS0QzCYLesiFD2jqbPkGdFdybgkWP2HyG8v1t0Ey6RcGx/An4aLpqQFdv3MbwzZsetjmiBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721982498; c=relaxed/simple;
	bh=kUZ+QOUDOoZYrAzmLK9PyEpWiK2Vt6YZ9Psmw8YKTB8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bf1DoPi4dETg+xZb1RhECe4OqFChiEUx5hs4XX9Zjydmqz1TJ6Tp1iStQDTtMlMTWj8gTo5BhcsaNXPeknT9UK1kMxWAbavCWW21q74WA/uFCigUg3enuC+DH5m7g9pHxi+ac3+kVaEp7K/vLSAD5NqmJqMFFMkydGPU4JdA1ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFxNxOQc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFxNxOQc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc52394c92so4038895ad.1
        for <distributions@lists.linux.dev>; Fri, 26 Jul 2024 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721982497; x=1722587297; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9y0B1iRYNow5PzdtCGS5ucv/6S2ODPYTxoeeQQiBQyE=;
        b=HFxNxOQcc86O4W1dxxXL2kkblHG6pbvOp3hVPsZwEMceYrClh9E95DmJ55As8StyPz
         d/zMb7sgpjcw8iNWtzTLgDMaIpw/77vjREt4LVrAvDxra8F8Tz4cArU3Za4ZtcT0WFqe
         hImLlRWX/2i1TRo2WprHCfCD2MzjHvCiGl4sK1NqtI/ZwlEODkJwxR+q/ZbxObBsbgPW
         em4A8TKUpdk410LmA4kCwtKfdJxLXK9QLpZ6GnwafwMM2yRbPFmBKd5rdwgpSE8lp9Ga
         nJDFgiJP4qzZcmPKl7MlsyzpR5/v3ug2mfGB/piFuioizKZY/+cKAHm4IJWBhvh3qgQw
         gImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721982497; x=1722587297;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9y0B1iRYNow5PzdtCGS5ucv/6S2ODPYTxoeeQQiBQyE=;
        b=eZvD4/eE8wFsKjtRQLmTwXGc4ktuHWFsjOloF7Aqhn7LxLZXNeqKGngF5at+Q/5wN5
         sbrIlI4NDo8o7HZxLjFtQ/gXiJWqnA52q5XHbTTHmsjMcl9XKrwmIBdFsSW2zaFTbgoH
         Sz9XAq20ITWZuHwB00Wu2nNjO0nt7MD8EauF284dNJ2VtOjpf9xvVSgIZgfgopODENmQ
         ipcBKg6/8W1RNLnSWK+oKO9A2O9pCX/yRSIGqrLVpMypT+sS/EabEHk3xARa6NvY20QZ
         grlYxYFoQmDNgTDk8Pa6MKC6cfK9E7BR5Q1X4MbogD+2TKYNWJhMMlpYOAF9962j5WlI
         JsVw==
X-Gm-Message-State: AOJu0Yx4Sw9uD83JD06Yrt7yUKMEFe4Z8wrk0IPt0gYpCRMnPRC3ZZh6
	TZw+5UhU6j3KfiaxDUKvUYKQNjk/Waz3bwSJAAXJqZ6lm4EhzgqrRQ4Pow==
X-Google-Smtp-Source: AGHT+IHdJ/49e5F4M7veuIiJBdJcZ/SjZBwLGZuU1+E+//wxxDIjexmfyy2nUnaEDIFhDMFoOVkVaA==
X-Received: by 2002:a17:902:a501:b0:1fc:6c23:8a3b with SMTP id d9443c01a7336-1fed38a5474mr48914225ad.17.1721982496477;
        Fri, 26 Jul 2024 01:28:16 -0700 (PDT)
Received: from localhost ([14.191.223.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2bef5sm26482215ad.211.2024.07.26.01.28.15
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:28:15 -0700 (PDT)
Date: Fri, 26 Jul 2024 15:28:13 +0700
From: =?utf-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZw==?= Danh <congdanhqx@gmail.com>
To: distributions@lists.linux.dev
Subject: obs 30.2.0 or later: double-free on exit
Message-ID: <ZqNeHWDimc2VH-id@danh.dev>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello distributions@

I'm not sure if this mail should be sent to distros@
If yes, please help me forward it!

Project: obs-studio

URL: https://github.com/obsproject/obs-studio

Version: 30.2.0 or later

Summary: obs-studio will load the its builtin plugins twice, then
double-free on unloading the plugins.  I've reported the problem and
finding to obs-studio projects but they're hostile to external
analysis.  See https://github.com/obsproject/obs-studio/issues/11029

Analysis:

Before going into the detail, we will see that obs-studio has a plugins
system to support extending its functionality.  I won't go into detail,
but in those loading steps, obs-studio will allocate some memory for
 the plugins, then, free them on exit.  If the loading of plugins isn't
controlled carefully, a double loading of plugins with a double unloading
later will make obs-studio run into double-free on exit, which would open
some doors for exploit there.

Now, before read on, we have this cmake code in cmake/Modules/ObsDefaults_Linux.cmake,
 it will be relevant later:

	set(OBS_PLUGIN_PATH "${OBS_PLUGIN_DESTINATION}") 

In the initialisation of obs-studio, it will try to load its plugins,
see libobs/obs-nix.c:add_default_module_paths(void).

In that function, it will try to first load plugins from a directory
that is relative to its binaries:

	char *module_bin_path =
		os_get_executable_path_ptr("../" OBS_PLUGIN_PATH);
	char *module_data_path = os_get_executable_path_ptr(
		"../" OBS_DATA_PATH "/obs-plugins/%module%");

	if (module_bin_path && module_data_path) {
		char *abs_module_bin_path =
			os_get_abs_path_ptr(module_bin_path);

		if (abs_module_bin_path &&
		    strcmp(abs_module_bin_path, OBS_INSTALL_PREFIX
			   "/" OBS_PLUGIN_DESTINATION) != 0) {
			obs_add_module_path(module_bin_path, module_data_path);
		}
		bfree(abs_module_bin_path);
	}

The path expansion at build-time will be:

	code: os_get_executable_path_ptr("../" OBS_PLUGIN_PATH) 
	=>    os_get_executable_path_ptr("../${OBS_PLUGIN_DESTINATION}")

And, at runtime, it will be expanded to:
(PREFIX and OBS_PLUGIN_DESTINATION doesn't matter, read on):

	${PREFIX}/bin/../${OBS_PLUGIN_DESTINATION}

Then, later in that very same function, it will try to load plugins from the configured
plugins directory:

	for (int i = 0; i < module_patterns_size; i++) { 
		obs_add_module_path(module_bin[i], module_data[i]); 
	} 

with `module_bin` defined earlier as:

	static const char *module_bin[] = {
		"../../obs-plugins/64bit",
		OBS_INSTALL_PREFIX "/" OBS_PLUGIN_DESTINATION,
		FLATPAK_PLUGIN_PATH "/" OBS_PLUGIN_DESTINATION,
	};

with the second path will be expanded to:

	code: OBS_INSTALL_PREFIX "/" OBS_PLUGIN_DESTINATION
	=>    ${PREFIX}/${OBS_PLUGIN_DESTINATION}

Effectively the same with the path in first step.
Thus, all builtin plugins there will be loaded twice.
Then, on exit, those plugins will be free-d twice, thus double-free.

-- 
Danh
