Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C63C1418
	for <asahi@lists.linux.dev>; Tue, 21 Jul 2026 04:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609927; cv=none; b=APhgJSKI6TsXcAiEse2Tud3Zrdf2ffK0aKsgaEt2axK4XRbepEv4x2qnBP9PRHdJhKAN7tycSoKhVwn/2Q5tnafzPDLKk+/9fKfx1r5285IxUi4WYSB6KAf7Yr8pFVibItiWFyYl51B4JOJ9KoTKr5PpaQz4A/OymjrxbkCNJYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609927; c=relaxed/simple;
	bh=WyjKr27BexD8uSwIrNS1ESTwNr61UqqGx5Li5oKMhiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAs+6zHs8CNqNhdB4/+Uq6wRdu8LzDHMh7KYro2taqXC3WomWxpvbkBgDlke9uEZTEQAPW4+nbwmuRB0MP+4sayMrot8HAuHCbdS0Cr8sajRBeDDiv1krWNsd25uRA5hXRGfOD7VhqFuORi3+91x8WlDsiF5avoZ8qAD6Ow8lPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUYIHiCJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUYIHiCJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso7572573a12.0
        for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 21:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784609925; x=1785214725; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbE1vu8p57+mDxFNsPodzCeB4DHzKs8bR2Bh8D54hrw=;
        b=ZUYIHiCJvZOoNbK5j5nTrW0M4F+4A8nady+yoGARqTSv9VVb6rPHojbjofz4g4v+HS
         xh6sdvnGnjtp15AE+a2BVhTM7apx1IxLy8kac9rQMIyEYJJFz+wsuqRg43vvfZRfC+4d
         juxmADS/FUqhf23R2Q9Gc8qA8dLmpcWe5yu9hft0cqeGp0Tf/HNq/mHGeZUN58tL83tT
         mu+S4AX5jm/f5RypmGYJ4J4pURHSHopoqt7r0NYztyMacO313sJCg68Xk6rTpGILGdU0
         gkfs0QXdBumTxiRuaINk0FqJSH7MvvrDs012B9Y57j1oGgYWa72EHKkMljnzWyYjqNSZ
         2t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609925; x=1785214725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbE1vu8p57+mDxFNsPodzCeB4DHzKs8bR2Bh8D54hrw=;
        b=SfaJKNtncc+cpil7RXYzgUDwzVfqDe1TixrPyde/IxZpJv5ZReI+dgXPdap2sqT2mr
         rijVjIhtGgN00sNSG8WB/WdhJovoaAoocoMP/mWcaPMotJTELFoUC3ewgcRohzBqyKoq
         h2hpZcSHH+sY4jwokD/K+CEvvI8P3ZTT+FyR37+isuQoE4GYkxQ3q2pvuBz/ulhGW1gi
         WK7SbSZcvuZAmNlKcFwe8sKVrfkghk5YeVvizgcN3hs1xN8CnV5vlNTji6vqOx+rckDs
         KnNgfdVJyBVzUOOVCXqPG7Csk8L7kDY7nAOCSTUUN/J9vu2uW48DVqzvxSCtmEYbJsZW
         4DXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEdyHVBASXXFnCfU60Te/0Wo5e3+PAzmY6T0fJNYwjOp9dj0e1ldPu/8oMKpTtPrybXCWoew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg4Y+01uuu7oHsJ0SqjWsC5OPh5X5v32hLVt5/pmqYfYD+yR41
	bQNnWEfPE/cdM+23s1pFoarOc3b2XfpYY169PLXFT48bVT8CgPAUjBszAsVOTHdILGs=
X-Gm-Gg: AfdE7cmC411nOkJ4avU9MOWdOsxvTxMhywL6eAG2/1LEQDDz5a1TpONmflu48bH8rnz
	Z2FN4CV4OYQ5+9FGTqRCPyLjt3jwN/2V78+G94INEGzIvjYBnQC9+Adc8J7dOU4JjrAGcw83ul3
	TOYigfjHD4DhCQ0FNMTNwe7Yo+lRaAEMw3d9gv7n79ylFzOeahd8MKaJym1nEifIuwTB2diwasW
	sj4y31h4J5d9aevXlbKUxx3iXK/8B1CZNAi7FCupbPUbQnklJ/fOUyI/2YhCzy7pf2fFandgR+B
	qcHmfzDIru5rdrV++6UgY4dWb0n80gdNqOJRM/9SoaFkdK+t3c74tfahSJ59kbejyPTM2Ayq+8U
	22vCQ6QLw5hkEI9SsN/d8qTvMYFNtfDQt0VHYV5wQHbblD2O6TSLd2CX4N/hMxJNgH7ruWDH+02
	Xzhw==
X-Received: by 2002:a05:6a21:9206:b0:3bf:a638:4371 with SMTP id adf61e73a8af0-3c3ad5d4660mr18319984637.10.1784609924997;
        Mon, 20 Jul 2026 21:58:44 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm41516259eec.28.2026.07.20.21.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:58:43 -0700 (PDT)
Date: Tue, 21 Jul 2026 10:28:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
Message-ID: <gleaxjdn6dyndlqr4lfgyvpnyje5rwznrktjf4e25giozkwjas@cp7upcmeae4j>
References: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>

On 20-07-26, 09:25, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
> should use a true u64 instead of unsigned long and "knowning" that this
> only runs on 64 bit machines, but the core code uses ulong everywhere,
> so this should be good enough.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Minor style fixes
> - Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
