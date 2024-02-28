Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631123757
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709102116; cv=none; b=oKcP9K6/3ZnU6nHaZGipUxWsUNRgNW1GrVA0Zwh3Pq5UnxKMjjCuWDjI2BZwXjqvxwGUHoupYm/phU62B4YVwYB6uVpJi5FyCVLYNtcSpDTtaQTr5awPD4Qk/aHBvsKN4SvZYpUdHwpjRSeZWRnxmZmar3UWXa/aYCqf1R6bsGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709102116; c=relaxed/simple;
	bh=eq+doyRi95dVt5ktF60b56jBW71LBSSSuonN4nhu8oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYr6iTbnXjknNMJZT/0OT2ByC1oWhBNnh1ysT6C6+7QQVnz+I8a0bnqyr8CSbA0icAe+sn7TTazSvOW1BCBEXaXramYj/TDW1dN3xdxh6gQNv2f6pNNR4IzIoj50Uj2rorJ/28PHW86ayanAfw6Ad5b+ABFOadAO/apvtZZuH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlCNhmgQ; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlCNhmgQ"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6e51d0so3906920b6e.3
        for <asahi@lists.linux.dev>; Tue, 27 Feb 2024 22:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709102114; x=1709706914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Lc8F5AVcDlsSeSlXPJ5yXQGz/3wpAQDPwCrkbyIyyc=;
        b=IlCNhmgQrOZ0H63kFC5N24213KpC3ibdd+63p2USA1/jQ9C+RxyCGJc/zPsBQrb21y
         ZyAxj+JPIToWYhhmVdqXXmaUHdTi0eczA1srpFuwzkHwbfbZEXKaHeNFtcVsoxQYuhoK
         VB2yg4KNu6OVtamLts1+VkhShTfEM/qJonSEMbvvtn1AW/UWDHzjJneQ10ewBIbaJN15
         nrzUmdFWgKWh3kQMOakN/f1B+P1Ec51vnUSuMLcCyXZftNDV3VNWZrSeca9dtlbfJ4jR
         EtFiOIQL9yuTfF37cpcxnN8CmSrbnmIBFGf0CmXKH+6bhZf0WX4TuwPI/FBzeaSoXebw
         Sb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709102114; x=1709706914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Lc8F5AVcDlsSeSlXPJ5yXQGz/3wpAQDPwCrkbyIyyc=;
        b=RKMTNTlMsmWHYPqOZLjoy7Odf8XkF4KhkORmI1RnNOh3u82nVuybLLmK3xGHEoNr9R
         rRraZaEFlwMEbfGu8E3vgCCyiwjpVoeTwBrYrB4Y5rIbfmtixz/0JbkqXzGgbfpDQ1Tu
         yV/gwkkftCZfn5wl9L7b3XTv6/foJubED7rwtZUYeDnYkzUAvmIo1ykJA/uKlFUKkmic
         FkCXNTjSsmYMlGnivDth8qqXZA6v7b4iDiAP8or6gGrbBEDSnBlYmt5QHSsWP+7mq6lu
         lnj9INRFgKsL7OPC0aqW6TG/O2thEfyBBBUYft+elaVufZeF6UWpJS84rs8aaVnBZLSD
         VqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ43NmS1PvneALf4cJ2Fo8BXb9VnokcKW0X+tdmJRnOfmK4PuozzCv1Zd0Pxtk/ZjUM4jraCB1Queac+yjVnfCjIH5Xuw=
X-Gm-Message-State: AOJu0YzAl4WD8GRr6Hkn0Q0Pqr+syBjc0i2lGWF1x1px7eRrIUgZFv6N
	yHPr7HfxNokmSS7aQWZp8ooBTc1mGvGXn0t3vt8VzuBtD9r8dV3MwpMFyZd8nEA=
X-Google-Smtp-Source: AGHT+IFFPuZE3jA/EEFb8gwODVORPCrdEpE/XY3KY3p5ZJQ+H28SBXnCoY07Y7TcPPXj1vn7YPDSag==
X-Received: by 2002:a05:6808:14c3:b0:3c1:8412:e9d1 with SMTP id f3-20020a05680814c300b003c18412e9d1mr5307918oiw.31.1709102114175;
        Tue, 27 Feb 2024 22:35:14 -0800 (PST)
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id ey11-20020a056a0038cb00b006e319d8c752sm7100775pfb.150.2024.02.27.22.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 22:35:13 -0800 (PST)
Date: Wed, 28 Feb 2024 12:05:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: dietmar.eggemann@arm.com, marcan@marcan.st, sven@svenpeter.dev,
	alyssa@rosenzweig.io, rafael@kernel.org, xuwei5@hisilicon.com,
	zhanjie9@hisilicon.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_rgottimu@quicinc.com,
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix per-policy boost behavior
Message-ID: <20240228063511.rcntpb3dhbbhf7fb@vireshk-i7>
References: <20240227165309.620422-1-quic_sibis@quicinc.com>
 <20240228050703.lixqywrtxravegc6@vireshk-i7>
 <c165dd32-1e51-2fac-38ae-dd7300d36372@quicinc.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c165dd32-1e51-2fac-38ae-dd7300d36372@quicinc.com>

On 28-02-24, 10:44, Sibi Sankar wrote:
> In the existing code, per-policy flags doesn't have any impact i.e.
> if cpufreq_driver boost is enabled and one or more of the per-policy
> boost is disabled, the cpufreq driver will behave as if boost is
> enabled.

I see. Good catch. The first patch is fine, just explain the problem
properly and mention that no one is checking the policy->boost_enabled
field. It is never read.

> I had to update the policy->boost_enabled value because we seem
> to allow enabling cpufreq_driver.boost_enabled from the driver, but I
> can drop that because it was just for book keeping.

So with cpufreq_driver->boost_enabled at init time, policy's
boost_enabled must be set too. Do that in the core during
initialization of the policy instead.

> I didn't want
> to include redundant info from another mail thread that I referenced in
> the cover letter, but will add more info in the re-spin.

You don't have to, but you need to explain the exact problem in a bit
more detail since it wasn't obvious here.

-- 
viresh
