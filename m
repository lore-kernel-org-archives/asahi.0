Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C914A0A0
	for <asahi@lists.linux.dev>; Mon, 12 Aug 2024 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723438485; cv=none; b=Na/S9Sp3MG7bRu1eCMV8KDNmMXh09smpmqWnGG5qq47v9T8KIY4CKbnNpoS0MeXmwY2lXYRtsj5tvZBc4PGnFnnIJ3ZzXWtCXG6Uug+nZHp1gGyrh8C73xqzLOPA2kiA5znYVbzcgHfmvLJfbQad+CysXLSkTLuZ6pwU/iukyEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723438485; c=relaxed/simple;
	bh=/7JNJRSA6Qai8rSOw/cLVCEzVurU5rT/F+Aq6+y0Oe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlDl52FP33maFwoLDxjmnZTTSxR/LC0PPafsFS892oTRdwuYShkpI2YB2l9WSZjEOmMHE4vNVChn3hgIGKAPYapZkzL3SD147najBKqJz6h/0GpThF/YgxG2poP1vTIagPJzZ6i3aqeJje+fgYvdJdpD+tq8+F/Mj3OzItNkP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpVHXNAM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpVHXNAM"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7c3e0a3c444so698336a12.1
        for <asahi@lists.linux.dev>; Sun, 11 Aug 2024 21:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723438483; x=1724043283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mM8hIk0Il1OoNYTiO69SEs09clvslubSlLyTOMarmXI=;
        b=KpVHXNAM/Okdq8H4crLHCxVl7tk9ZggiqgberXN0cGvAAIn6Vh+p/ZnHvuK78GKSy/
         issuaowt1g22a8uUK6dp61/v0et3tIKSOJe1YW5lJNYUMU0AUwAOMjX+Fah6WdB4RXe7
         rQYGNakEB5PjNXtqMAfvODGt+tIfCjTSiz/RDNMW9GLgWqh1Yfmp0bq2GvFqmbdqq/tu
         yZM8dVKzqcgOFT2QpJNzyrkIhiHqLaE6NbO4ylBKNWRcoVpI/DraRDjKhmGWP8S9ZOIE
         NrOKgWzL4Qd7NhiRA3jNpN7USgUa9eb0+vvMihOZwuBfcX1f/RIsyV9GbV6JvkK/ojZy
         VsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438483; x=1724043283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM8hIk0Il1OoNYTiO69SEs09clvslubSlLyTOMarmXI=;
        b=AotohjG0b+CO1P+Gf/WFzM1wqpQtDLHHzOLr0M9WTdZlJz1SoMCNqJkJEk6CNARoCO
         B0tRJcowK9w5KpsCkX3O5J55Obbh5sOQeELK3CmXLlr3LAsrJRCgDW1oVDG2bPx460Un
         xorF28znvM5X30PaXep8tebPWN1xgyyu+CqMs/e6WPrpWjkcLzkMnppGRv/Qc4H4TCkA
         4zVYEhc7gfbBeJoBdlqEFdW7m/zLQiugm2gXbz3REX1r5bblUjJKpoD9kjQwPtbJSNYw
         TSPUV+Heyx1W7I7kgzQ7EHXN52c3E4k0JzWXnjrsi6Pq2SVQvRLh36Ooj/ROrav0R2IJ
         eyUw==
X-Forwarded-Encrypted: i=1; AJvYcCXcNThoOWpnZqxclyxFmY0Gg4UHT1XP5zlAclabRkSGIu/tSi9hsklEI+aSVe3TZM9JRstUQ4PJWzSyL2IeU55QQXEek20=
X-Gm-Message-State: AOJu0YyBLqkSGu/HOhMWZd4HhQ2vIagKnKudtxG/sX8LDIRGLX/7p2cE
	2vz6+ECiOygGN++UWbTjvJeeU/UrEP49fGRngqz0qeNLhX9/aqtUDJ3aibTuWYU=
X-Google-Smtp-Source: AGHT+IG9Hm7mz2IYGlrpM4SuzTL62Qbzr6jN0CUn18M/7AjFxPVmd28eUBvkwj+lz/oTj1+27nZaOg==
X-Received: by 2002:a17:902:e845:b0:1f9:e2c0:d962 with SMTP id d9443c01a7336-20096baa066mr174277115ad.31.1723438482987;
        Sun, 11 Aug 2024 21:54:42 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9fd0dfsm29338335ad.202.2024.08.11.21.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:54:41 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:24:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ilia Lin <ilia.lin@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel test robot <lkp@intel.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: Fix warning on unused of_device_id tables for
 !CONFIG_OF
Message-ID: <20240812045439.tbdsbdwcxntoafdh@vireshk-i7>
References: <20240809172439.908092-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809172439.908092-1-robh@kernel.org>

On 09-08-24, 11:24, Rob Herring (Arm) wrote:
> !CONFIG_OF builds cause warnings on unused of_device_id tables. This is
> due to of_match_node() being a macro rather than static inline function.
> Add a __maybe_unused annotation to the of_device_id tables.
> 
> Fixes: c7582ec85342 ("cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408090714.wcrqU6Pk-lkp@intel.com/
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Note that 0-day only reported 1 warning, but x86 W=1 build gave me these
> 4.

Applied. Thanks.

-- 
viresh
