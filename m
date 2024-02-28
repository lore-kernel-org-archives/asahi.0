Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB5620B17
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709096828; cv=none; b=YcqZmX92oNku+T4MaXNbw2jLulqWUW3NhvTTOaeiGWIf8NIfmbriJQ8ecPCM7MY5CrGISjkik+MyO5jCI9AzRk+5/yL+FeNLPP4/iOEshu4eVrbVBh5a1q06lU9rrSGdx7RX/Tdw5hTjzI/LfjHjnFkmlomDsjL7vm4E7wmIIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709096828; c=relaxed/simple;
	bh=NDYMj29qtQkbokr4QHvEZT1PzlIAohTJuF1hqdMFy6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/uReyP8FVvFW8niACpvGtpTHTB7nI5vHDla89H0Zg/AJVw6h56YZMji7G7Jj5hyYyrju1zD1/5nlV/MDAkqc0Wa7wOH90uDtyVylv8JDLOItJt4FB1CyJbnQedmmjLZVjFMkxiZpbxKKiIjhctKdUj7wo6KQAqgSaAOD+ALrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8N+1xyX; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8N+1xyX"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so3037139a12.1
        for <asahi@lists.linux.dev>; Tue, 27 Feb 2024 21:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709096826; x=1709701626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0hZi4IwldcafUQOYCQfscMvfB7SqlvXbZvfr+ma3bQ=;
        b=p8N+1xyX7nTfgI3y2dz1EnKNKqi48ScIBeq4P8rk7qK9PDE7hcKyPxUn74sXE+xWU1
         SxVR0/03Hb/Nfg7fxIuAf0+FVqYl3Lk8+ad4uv873C533alqC/mdAChO5FfQzPFtZ5i7
         mgtmpcxDoleoej3H4gUHmARfwZncbqMss9BGK77K5/ZgACqWuhHCFHZOOtmWl9TZJYeO
         beFUY6SuI57utYtdIlBzm0Nv2F5IloupcyiBi3FkEm9qlirobcYCpDVhq3FJ5K2Clc3q
         Lzlav/7dW5fwDbMo/VZ+j81YldKR+9YJcY7BWVZ1Qs2NXKfrt4E3S1w/2V9DWHyPV7Oh
         N/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709096826; x=1709701626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0hZi4IwldcafUQOYCQfscMvfB7SqlvXbZvfr+ma3bQ=;
        b=t7OGTc7GZKxzjJWCSRrRPIemHBH/l9XowznemGQr5gQiZKtEdU6ZKh3pf2qodTL9tj
         XVvMT6kJe1cMsbJRSDecmj3PD1k0r4UIIqrUgiBKDW4B5vvbW2621Ohbo18M7iepLLvZ
         Tpygkczve98uekZy2Na7AGg121wzbrrHLXZLdjTTAgWs9VRTB/WLYoQyY1rHjQiHa2Cc
         I3nAWZ6WvMGXDzEB6MHzb+zQHttkO66EIzIisXpNBNIOarZYfZQCNfdfCNGzwttEL9lZ
         gOXLZ/LzW9ZfHL1mr0fmwHrOtITndLkSdH9fNw+CYhWFf+HYTCqWxvDZHC+XCz07U77m
         0RBg==
X-Forwarded-Encrypted: i=1; AJvYcCUH5QStuWLpsiaT/ow/MMtIFfHgNRbTUvhw0dKuGgCGMFFzhI+lXCRgRaue7P0iUx/s5WJQjtp4vw7rAzdKh6ZRdFZDPFY=
X-Gm-Message-State: AOJu0YweVRx7oXE4S1pAX9mZ9t1uPPF6nmRseVEB6Ns5mB/Zqbn3wshJ
	24NnJkPmFPX0ttZpzP49bJBmWPwj5Xf3nJ+ZXHlQoVRXD/3p+sXrFlK3aZ+G5tc=
X-Google-Smtp-Source: AGHT+IEXutCfwWDafJj/H7lNFlXr51oQWF+rHXoJlF9WsTiohURTpGuvZH0dIKe1xDg4l5M6JS8/0Q==
X-Received: by 2002:a17:90a:bd16:b0:299:275d:c346 with SMTP id y22-20020a17090abd1600b00299275dc346mr9882375pjr.5.1709096826514;
        Tue, 27 Feb 2024 21:07:06 -0800 (PST)
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id sk6-20020a17090b2dc600b0029abe1c3f26sm511598pjb.1.2024.02.27.21.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 21:07:06 -0800 (PST)
Date: Wed, 28 Feb 2024 10:37:03 +0530
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
Message-ID: <20240228050703.lixqywrtxravegc6@vireshk-i7>
References: <20240227165309.620422-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227165309.620422-1-quic_sibis@quicinc.com>

On 27-02-24, 22:23, Sibi Sankar wrote:
> Fix per-policy boost behavior by incorporating per-policy boost flag
> in the policy->max calculation and setting the correct per-policy
> boost_enabled value on devices that use cpufreq_enable_boost_support().

I don't see the problem explained anywhere and the patches look
incorrect too. The drivers aren't supposed to update the
policy->boose_enabled value.

-- 
viresh
