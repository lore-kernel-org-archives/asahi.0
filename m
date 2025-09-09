Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9E3191C4
	for <asahi@lists.linux.dev>; Tue,  9 Sep 2025 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413918; cv=none; b=Sw/HfBoqhstDsNtZzH9Mp9KJZmIVKrC+RgCcfQwnHafWIcxU9zHeQW3GAPBXJanunZzXjOEco/lNrBWYQ9CYSzL5P4X2cLKjiFAW2+lLR+QS/noIREUZ2qCdEks2wCm3awPjAbnBGzApHt/FP1lw7vN21Qmm4HaEHhPqzk4QooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413918; c=relaxed/simple;
	bh=lj3i7DkwgDDQfj+771UKfDbe8JmLcdhupbsoCJs0uWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVVaVQSJMNfqpqxvJhcfTGfl1nuXiE4tET/zngVYRWqn7wVB6ye7vBy1IcR95k6/gQyFCfwa09uwDV2qCXRaSI1WDU+6f8Nlqv5A7joz1d5fYU+op1VWVV1VvipTB9O9xFXixDDl2kgRHM7RrqmqCYTJ8hrJEAL5gp6RzXOeF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DymGiR7F; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DymGiR7F"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e537dc30f7so1812779f8f.2
        for <asahi@lists.linux.dev>; Tue, 09 Sep 2025 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757413915; x=1758018715; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HW3k3a1g3PxSXTokioV5I6j30q9AGehCL+syHRYqQJY=;
        b=DymGiR7FREfPwH9bTJ6ZuD1eSpoDjVa0EN1PvL4snFAxaIcbaNewI0+tkNv5hKmsrE
         V+ILD5zqKTY4WMhaxc3H3Poq9frK0qH3b6Cw85zZUMB6nff0OeuTdtHbMq4MP6RuqZtL
         uM1xCNQodkohM5UZYE7kTVjEOx1yTewVpM7Ci09lEW1N583MWDpNFCimBC/7bdP9idUo
         Ezwlggb56hmD5VAxvcGEycFaWsacz4hY0B+FhRSAXfO7MHVg5cJyVnCwDDr9hLIme6WU
         gcd8I30Zgq5THkMy3/feI8vVzMm7xXp3tK3G6AL0FLx+t5zGHYNu4172CYR6FDZHwR0s
         +qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413915; x=1758018715;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HW3k3a1g3PxSXTokioV5I6j30q9AGehCL+syHRYqQJY=;
        b=gpiEmOmnEloSsQ9yWve2sH6bQM4O+cUmAf/6zn10VfxuwX5udvFhuc8Ubzjm/PPM/k
         w+hF14dXfZJt3VXZJTeis3eenx+ATrf+1qsc5NS+sgcVBkzj95N/OLV+952NzB5aSY6H
         mpB2GRkSpRA0hBRUN7rxVP1G/GMiAfMaX1L5BYFWNkPv42j1MlMR7c7C1F3rVMeLuGkD
         t26rN/2lGdS+F1g51XPCoxQSSC6GpBYQ5M0Ib9ezDGf8W4JIIqhf87o1dbbwBGemikIN
         8MrGgA3Zkcwnn6lJ1hrkMjKSUmNBrJE2a9H216cE/Rsjp5fiaUawOT4vP/Zs6/tN7rbe
         Dzyg==
X-Gm-Message-State: AOJu0YyUqv8TRsKFwNHWjSP/u4Q8Fgv2MxFNBzvyDXteOhbllZxiwca5
	y75nsY0eHAoNQhJeW1JiMQ+lVnRB6B7D68nqSwHKqHB2+5evun0VmbcPYtVvdDGtx88=
X-Gm-Gg: ASbGnctGBfL8/BRo0HEZF3Dushm7EihfxoUDjvlowMD2tc98il/wzfmALecQ53tTJUR
	CCGveePcW7OaFZuctAX1nEU9Fp9d1bU+s82O+0/bYya6tEM8qvXiz/L/dacxzMF+aJ3uBN973f6
	uXm/oei+9WgjEQelaqVck6e6vBypPQ0OVDwI7k61h0L6J88nzqF5ARIndChK0pdXzDJdclEEUlb
	asrKjYuFG6HUbL6H03aEnyYBlcsJ0NQ1YsmcF0bGw6IFqmtYPEob6cTlnMuaAsAyMJlYUBagf9J
	jBQMG0m4kbEoigSvvAzcqe6mazTPindtARPtF7J/YIwY+FDxqml5FxnlKZs7kIH+ICbeSnqcZfd
	dKZ9reiWYIIV5mmYSojaghycNC37+A6OUhy7xgQ==
X-Google-Smtp-Source: AGHT+IFoH9EnqEx0+Pe7sMyMKqAMtXnTsmvRwSvLBqe7bfnXupVV7qrijqcbw+6s8Vdt6wGe0MhdPw==
X-Received: by 2002:a5d:5889:0:b0:3e0:152a:87b4 with SMTP id ffacd0b85a97d-3e64392b7a6mr8151669f8f.35.1757413915001;
        Tue, 09 Sep 2025 03:31:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521ca2ddsm2126411f8f.23.2025.09.09.03.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:31:54 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:31:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, iommu@lists.linux.dev
Subject: [bug report] iommu/io-pgtable-dart: Add 4-level page table support
Message-ID: <aMACFlJjrZHs_Yf-@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hector Martin,

Commit 74a0e72f03ff ("iommu/io-pgtable-dart: Add 4-level page table
support") from Aug 21, 2025 (linux-next), leads to the following
(UNPUBLISHED) Smatch static checker warning:

drivers/iommu/io-pgtable-dart.c:183 dart_get_last() warn: array off by one? 'data->pgd[tbl]'
drivers/iommu/io-pgtable-dart.c:252 dart_map_pages() warn: array off by one? 'data->pgd[tbl]'

drivers/iommu/io-pgtable-dart.c
    174 static dart_iopte *dart_get_last(struct dart_io_pgtable *data, unsigned long iova)
    175 {
    176         dart_iopte pte, *ptep;
    177         int level = data->levels;
    178         int tbl = dart_get_index(data, iova, level);
    179 
    180         if (tbl > (1 << data->tbl_bits))
                        ^
It does look like this should be >=.

    181                 return NULL;
    182 
--> 183         ptep = data->pgd[tbl];

data->pgd[] has BIT(2) elements.  The data->tbl_bits value is set
in dart_alloc_pgtable() and it has a check if (tbl_bits > max_tbl_bits)
which ensures that it is not more than 2.

I don't think dart_get_index() can actually return more than 3 so
maybe the check can just be removed?

    184         if (!ptep)
    185                 return NULL;
    186 
    187         while (--level > 1) {
    188                 ptep += dart_get_index(data, iova, level);
    189                 pte = READ_ONCE(*ptep);
    190 
    191                 /* Valid entry? */
    192                 if (!pte)
    193                         return NULL;
    194 
    195                 /* Deref to get next level table */
    196                 ptep = iopte_deref(pte, data);
    197         }
    198 
    199         return ptep;
    200 }

regards,
dan carpenter
