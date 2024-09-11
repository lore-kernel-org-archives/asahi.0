Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288C18E04A
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726056838; cv=none; b=rLbMXvb2bwuZ8OoUO3OhYTwc+d1l6AR8q7brUkJ9gXGF1DIUxgOR56geC9mBXiH94q6AQ1693eQznpjQ3B+tqLIsgqU74RQ/rpkp3ih+SIdH2njVESjU9Np6/MlI3CoCQMpnW8HC0foTnam0dCCYt2R+5WISigFul6GgjsPp/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726056838; c=relaxed/simple;
	bh=CKO7NWWWSz2NvVfR0jjP8DjzbrlPQ0zU6QxXmpTDue0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLNOfeE6jzU+jK1JxBCCLRaQklCrIcJp9pdg0iHiGZsUNscjHJdXq7Z2akyPO2f0bR8FKdu46pxUkf/6dFzIayn2IqKujH0JMiWPAusjqgsylxFuiJx4trk9eInbhrHGS3IitRw1jHtQ2zqNniEWlo6b+ZKKQtnHuaWPloD9k0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj8JAmsr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj8JAmsr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2057c6c57b5so4580505ad.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726056836; x=1726661636; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKO7NWWWSz2NvVfR0jjP8DjzbrlPQ0zU6QxXmpTDue0=;
        b=bj8JAmsrzc+CcLZqycPpclR9O88pJwi3GslGB5451yJqfzNjN79NPqKzCUHrTV0iVT
         M3t/wLVBwzFYHHFm+gJqFhaHxGKdEKB6lKAATBAOZNQycDIMLU6IIiI2L3wHV3m3Z5H/
         X4EUBqY16Fg+JGSbFXJ71i2MlBbpKnt/OMzGChTEmVu/1/BZAjMxDdq87T9LYKimr5ef
         MogE8JMZV+yTwFsF5zWdlhb82hG+QbFtA3w1yo/VjVVxVSKgql55ivs84d+CXiB/kBiE
         8Mf42oaGB+8Cksa5q/RD+WxDM7Rki19mX+2z5RL0y5/L0YnS0NmgVp5lMaGYJEduGdE8
         lNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056836; x=1726661636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKO7NWWWSz2NvVfR0jjP8DjzbrlPQ0zU6QxXmpTDue0=;
        b=DYNBJIUFjVY5NIlIitRfCEyYQKDcdJFmFka9CKEbuYnqTdxfIiEBLv0efWOPY68VQJ
         ylWfL/2lkE6m9qvcHMISUdm8qHdhBnnLoFJFalUSowtE36r4aqHhyCQK+VePk5pF43by
         s+Avds8/NRqpST+d26UboMZ6cl9fYCtXu9jcEz8ymWZCgb4YR49RddoxV0DMRbNAnBAV
         VMK+o3QCw8EdMHRzd+AAIs5pnO2q7Ut3X3n2FCsFovnCxteFdBa1lTssnrlqtMrfLyRF
         8k/j8bXVeIyafutriw575UrzG702wWVuD4O2BBq95mAjnH6B0RbtMO97M72z8UUdcJa7
         Hpwg==
X-Forwarded-Encrypted: i=1; AJvYcCW2yVIEo1M3mwXVwNhMgHgGTh3hjCe2hWekhMKMeEBOrO5yjXyLqZidWsRR3flcZGaSQmv1LA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCtKXvitePqEj63AqaJyntf+y49ML+A5KwLdaQKXFGru/0GOun
	NL9clowI3yIJKXqk11mzMk0qFj12HG/9VB2eAZazcolX5Eb8b+Tq
X-Google-Smtp-Source: AGHT+IGdhEUo8Vuh9+fNRqoiJFys7qBs7E6vjNTWOIbdzrlIFWUOFggUlnmn8v6+uGErb/2AwctFPA==
X-Received: by 2002:a17:903:230b:b0:202:2e81:27cd with SMTP id d9443c01a7336-2074c760c12mr61204155ad.26.1726056835955;
        Wed, 11 Sep 2024 05:13:55 -0700 (PDT)
Received: from [172.20.10.2] ([49.130.85.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f36266sm62138485ad.283.2024.09.11.05.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:13:55 -0700 (PDT)
Message-ID: <369a32dc-330e-4827-a61f-5686f7d90a07@gmail.com>
Date: Wed, 11 Sep 2024 20:13:48 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] Initial device trees for A7-A11 based Apple devices
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The Home Button probably should be assigned KEY_MENU instead of
KEY_LEFTMETA.

Nick Chan
