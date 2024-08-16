Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F813B286
	for <asahi@lists.linux.dev>; Fri, 16 Aug 2024 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723798665; cv=none; b=Z6ZaLDM4v+JP+20wAzATGW4U7ao2UJRwIXww1lMefwF+4HVWHeTMIueXihs6dH7/9LF/RSPvJYwmEbWap38dtwJ8SiuhN9O1Xe9yU1E9pUfdFqb9T1AtxZnGF4fZOZ1ucX8S2UQFHm/DVs87AvpgMIq4BLvehwe/c+0iiadhSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723798665; c=relaxed/simple;
	bh=fETSMc2hQRMfQ2Q133dwwdGv+eoSJjlO71/zUgfQKn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1aeOzlbPoO6fTAg5RBTmzU7XDK7106Wls6I6BblQKRhFg5ah60KDyOV4AESXX4LDKG1JvKLj462jbQYGMVVpdpCYorCVJh8rSs+Sx2kQkjhItkBAn4lsj5n3kXDjCTy0bBOkdN7F63IDlKQJx7hQ9BfQuvqT64JMYhIiBjp/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=da/bgPZi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="da/bgPZi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42816ca797fso12647345e9.2
        for <asahi@lists.linux.dev>; Fri, 16 Aug 2024 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723798661; x=1724403461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pp9E1jzP/7LqcZV9OE83mHHXcT7BGqq4jDbXGUvR/tE=;
        b=da/bgPZiZgV3BEAMpkivs2hPbNq+y2Sg8UNh+nQo/KzibopfvOouRvXtjUUJdCHt3y
         CkBUzsA6DNx1C/bxoRQodaol3857hXBseaMU6n8fSS0yt3AsbwtWvNe4eMV2IgDyzSsN
         uNBF1W88sAcdpK7pnMJ1lYZ1uBk2krUIQct9aawV7v9ezAH01fvt0IF+Q18+lQ8wgJx1
         uDzDyZdVNlElZkV45buTEDtLvJ+bB2yQnbN8U5UyRlIW6THYgWkWj+pY/1NRtqUEtv45
         eyWxGjcZmCYBgMy2uKNGaqKeFReYL7FEFB25NJmVprCBc+c1VqeTlHd5dKjvz/NjL80c
         5KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723798661; x=1724403461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pp9E1jzP/7LqcZV9OE83mHHXcT7BGqq4jDbXGUvR/tE=;
        b=HvOit3+uRZZoA4u5bXesu3bcazr8Rz349cJhg0wIGY5HMyClcCnLc88W6lFip6+ONs
         gpJH2noraijUtIxyo3h/jZlllbPWHCluTubcR96J20UimCuPfVNDiTObNOMIy8S3+kAl
         fiOt4cX5xvzbttX8FElXEvnLNB8fsAywYLZdBD6tsBqoYEsaV+Ly2//khW89fA9rAAfG
         3DM0VmXyeseXvYcrXpQbJzSnKco6V0+2PDko37tReu/LiiKjrWcygrG1snyH89GY7dUH
         t2ks5HDDKeBJfR5X1PPN9LBfXhH1+hrN0b+Bk5PdPUYPuz0WcSpJBR/8vQWSeVO4+WMm
         xLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYPB5oysxE5uobtVLgCGTLlEK0tw+W7/41KHcyzPEculPiKvgt3aWCFNaq+UT9D45ayv4rwgwq6UdCqECCOBftn6o9B3c=
X-Gm-Message-State: AOJu0YzlkzYTNcKQSHZu8bIrvFIZlOX0tCE0/PhHieMDzC8aQcIVC890
	mOBCAdFR/aXDKL3pk2Q6v57kTzxq2L38XqGko4xnW0FtAs1Gc5b1wumWhFjzHbs=
X-Google-Smtp-Source: AGHT+IGz56bQpjBbGo0uOLNED6Eyr940dKNOhXmrjPU5vtmy0ylGk957l6Yh8SHw3K/Bcwg+P9nRjQ==
X-Received: by 2002:a05:600c:1f90:b0:426:6960:34b0 with SMTP id 5b1f17b1804b1-429ed7bab7fmr13192735e9.14.1723798660662;
        Fri, 16 Aug 2024 01:57:40 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed794640sm16916315e9.41.2024.08.16.01.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:57:40 -0700 (PDT)
Message-ID: <88cea92d-98ee-4a1e-8a44-a7c6a247ba2e@linaro.org>
Date: Fri, 16 Aug 2024 09:57:39 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since
 v6.5
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Ian Rogers <irogers@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Clark <james.clark@arm.com>, "cc: Marc Zyngier" <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>, Asahi Linux <asahi@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <ZV1AnNB2CSbAUFVg@archie.me>
 <a9c14dfd-3269-4758-9174-4710bef07088@leemhuis.info>
 <CAP-5=fXqx_k1miPTkcAmS3z2GBPt2KeDtP5fknmdDghZqxXPew@mail.gmail.com>
 <714ed350-0e6c-4922-bf65-36de48f62879@leemhuis.info>
 <0de3b572-f5f7-42e4-b410-d1e315943a3c@linaro.org> <ZrzeRM3ekLl9zp3z@x1>
 <348ea015-eccf-4f44-a332-a1d9d8baf81f@linaro.org> <Zr4eWd6HWLHDcpC9@x1>
 <Zr4kZTxgvD6bmi37@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Zr4kZTxgvD6bmi37@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2024 4:53 pm, Arnaldo Carvalho de Melo wrote:
> On Thu, Aug 15, 2024 at 12:27:21PM -0300, Arnaldo Carvalho de Melo wrote:
>> On Thu, Aug 15, 2024 at 04:15:41PM +0100, James Clark wrote:
>>> In one of your investigations here
>>> https://lore.kernel.org/lkml/Zld3dlJHjFMFG02v@x1/ comparing "cycles",
>>> "cpu-cycles" and "cpu_cycles" events on Arm you say only some of them open
>>> events on both core types. I wasn't able to reproduce that on
>>> perf-tools-next (27ac597c0e) or v6.9 (a38297e3fb) for perf record or stat. I
>>> guessed the 6.9 tag because you only mentioned it was on tip and it was 29th
>>> May. For me they all open exactly the same two legacy events with the
>>> extended type ID set.
>>>
>>> It looks like the behavior you see would be caused by either missing this
>>> kernel change:
>>>
>>>    5c81672865 ("arm_pmu: Add PERF_PMU_CAP_EXTENDED_HW_TYPE capability")
>>>     (v6.6 release)
> 
> What I have now is:
> 
> 6.1.92-15907-gf36fd2695db3
> 
> It was a bit older, but 6.1 ish as well, I'll try to either get a new
> kernel from Libre Computer or build one myself.
> 
> - Arnaldo
>

Thanks for the confirmation. In that case you may not even need to 
retest. I was only wondering if it was broken from v6.6 onwards, but 6.1 
not working is expected. And I'm certain that you'll find any later 
versions working.

>>> Or this userspace change, but unlikely as it was a fix for Apple M hardware:
>>>
>>>    25412c036 ("perf print-events: make is_event_supported() more robust")
>>>     (v6.9 release)
>>>
>>> Do you remember if you were using a new kernel or only testing a new Perf?
>>
>> I normally use the distro/SoC provided kernel, didn't I add the 'uname
>> -a' output in those investigations (/me slaps himself in the face
>> speculatively...)?
