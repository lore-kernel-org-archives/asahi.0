Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E24BFE8A
	for <asahi@lists.linux.dev>; Thu, 10 Sep 2026 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046101; cv=none; b=XMFhhNoGPS54ehZj1WgGvhpg8fPFSOLVmY4aOuUoG6Uho0b/mZHZ9zI5t6ptgidSTmyPjZ2lXn/I/kLMTKKLIrwZl6CtkcqPRdBUr6tZeIYz31WVYzzSERoWVspW9x2w2hcZo0qWpiRjzLpvvjlx07fhQBFR2wn4D4S3xxOGzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046101; c=relaxed/simple;
	bh=Fhcz7zRXaoEd6RTrKzOoGmX+Gn8GSkn8A+h7XSB9Hrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rs8eSsDJ+gu1pQ7KyI8cNvU7k078itX06xlafHTydv0u12b2EaTDQcsWP6JQ0US8Vguf9IHmJEHqUY/9RWiAOCkx+uoW1nmOHmFKx0mrOMlBh0hjvMk2e+9i6yqExdqUJdVGktZjFkqTtwjL791F16GE6uQLi67s8AtGLRTCjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJJ2D/wW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJJ2D/wW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so12368075e9.0
        for <asahi@lists.linux.dev>; Thu, 10 Sep 2026 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789046097; x=1789650897; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09cSGKnFCYlhpbqcXyRvkYjCUMvVZR3YUHka/xDjWQA=;
        b=jJJ2D/wWamGE8D2BvmwoWuoeFbr9kTkJOs7UHeuv25/g27G75TJGNjlqy49UoDBHVj
         xKH5ztSr36hTmgWUMn1v/FYCjjs36hHpdLz83e7qFww9MsPfZTTEHskj5ZmfhU0QVnjk
         IMbzQvtL3lSjkja/noqo9jExmTqPFMraygE41AH7t9NrUyBCx2ZrRvLWkWPf3bGD0b85
         kRXmbSyPl4yDa6e+DJA0vDVb/jrH1CtNcS4jLfugFtvYqjaZRyZ9ZbK6E3ZUA2AAmS+r
         DVhfH4EMUiSHU6LnmioOg80IJvFsIrNmeJt/z97dTSvGUHEHWlDHknrONb790oUmrJX6
         C1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046097; x=1789650897;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09cSGKnFCYlhpbqcXyRvkYjCUMvVZR3YUHka/xDjWQA=;
        b=JXZYW23EbjiODC4CzNLqXFz8FOAkn6mTN0+Cur9jM0PmFGC7yIm6u5+25vtVVtyhTv
         zzYfiRTW8SVWavlWY8Gn/gk6r5fMQD6XMjGLfnBAyAlOzoBxV8Kussek0NfcR7NFXjuO
         nr/9aX05JEAU1kbHG3t2Y+aeDPt0+Pt17dG+O8X/m+SvypMdMz2vY7xQrcc3cAhAC5uX
         +m/6gZKqwhHZ42/iXorv4S7p12XnETbKHL4Q/FxkYfC4sYNCeL3b4OY3PKuBbDgnf7k5
         eLWTRAfR8XTWvy6Ka4FFE5gi3ElrdWjD3XYGumV0wg44ehl2987vxis34Cs/2HRfe761
         EJKg==
X-Gm-Message-State: AFuF++nCqOnuKu6o9UAMbFU0XBNeQRpA3ebB2wz8cWFVkWzcrss6iWDP
	AFky7q04vSCNimwVoVEcYDbZURyk/RPN4rGd81jE9ko7PgzO7t7QeeitdL4vrlr/3QQ=
X-Gm-Gg: AYBFou2xwuZa0pZXc6mojh0WsRC42seeO+NqBnIP8uVpI0X/LiXYSNCh4+8gwkkuYXk
	eGQ5hk9RwrLM2yl55XPagKaog98L/gIIBi3cn50f9jYYC37QzVUJaGLu7kdMeRy/P86+Bjw9jQu
	xyBJDYiFtFhLSzi8tlXq8S+tqZdBBEDVrA/PMg72CxytZOnYlj/Uz6TGM5HarMwCOa6kbJWsUG2
	Dmj8sNN8OIjyVWLLLr/DZBQoVUw/ak+u0uwct/XTNs/Dz1RifqmJhwuUgU+uvtZZGI85b6j0FiE
	Iy0x+QX+JDO+o3nfrm5xmwCw2QOgCZ6uJ2aVs1ryyatn27ZiKi7M6QRzbspEsv8V2lBnwIeph7c
	iEFO00L/Rw1vMOA4b5vT9vfm/924t7s8CzYTGLqmiThq/6c7zpzmqkLuuTImaQ6870KFk7Ixm51
	SkhNygCn/72haWnub2i+9cMAm8ALb6J0I1MfMciX8C1N2g57TghRIQhiOWlBjJndzk1ZDQ1bBZW
	yHB6Gc1GJJwlsR1ULM=
X-Received: by 2002:a05:600c:4f8e:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d1f22755amr223208745e9.5.1789046097419;
        Thu, 10 Sep 2026 06:14:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fb40e1sm131152225e9.2.2026.09.10.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:14:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: u-boot@lists.u-boot-project.org, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, 
 Sven Peter <sven@kernel.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Tom Rini <trini@konsulko.com>, Francois Berder <fberder@outlook.fr>
In-Reply-To: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
Subject: Re: [PATCH 0/4] Apple NVMe fixes for macOS 15+ firmware / M4
 support
Message-Id: <178904609637.1818032.13027647184967728015.b4-ty@b4>
Date: Thu, 10 Sep 2026 15:14:56 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Fri, 04 Sep 2026 21:22:38 +0200, Janne Grunau wrote:
> Hej,
> 
> this series adapts Sven's Linux nvme-apple series of the same name to
> u-boot. It fixes bugs which are worked around on M1/M2/M3 based devices
> with NVMe firmware from macOS 14.x or earlier. Starting with the NVMe
> controller firmware from macOS 15.x (required for M4 support) the
> workaround is no longer available.
> 
> [...]

Thanks, Applied to https://git.u-boot-project.org/u-boot/custodians/neil.armstrong/u-boot-nvme (u-boot-nvme-fixes)

[1/4] nvme: apple: Don't set a DMA direction for commands without a data transfer
      https://git.u-boot-project.org/u-boot/custodians/neil.armstrong/u-boot-nvme/-/commit/f31c5646ccac279d11e128b8c42e968847eb7df2
[2/4] nvme: apple: Never set the opcode in the NVMMU TCB
      https://git.u-boot-project.org/u-boot/custodians/neil.armstrong/u-boot-nvme/-/commit/bf7661a63cb9f2804cc8851f60686a490355a193
[3/4] nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
      https://git.u-boot-project.org/u-boot/custodians/neil.armstrong/u-boot-nvme/-/commit/b63d271ae7c034033a06e771e06d5a72cd41269d
[4/4] nvme: apple: Drop the PRP null check chicken bit
      https://git.u-boot-project.org/u-boot/custodians/neil.armstrong/u-boot-nvme/-/commit/b3f756587082dac42a828ed74b58f64ac4f336e5

-- 
Neil

