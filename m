Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1FFC0E
	for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TyNzzadP"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3600101e819so19005ab.0
        for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 13:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453995; x=1704058795; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9Q+OMVGug+ylz+2uzJShCURagJfqE6miFHjz/+Dgvg=;
        b=TyNzzadPSvZzzsDgvPA1L5D2rOT5X45ipnVxmlbx/yK9JxDKu2rMIdYNr4UkYzVRml
         14su1p+adDp0rXKawmBBhueszqgHsoQKFgrVhJ39xMKNeN4EwzGc5wiA2bBiBCPmAtwh
         oibtMIbxyO5fw7CiRUOu8+BdIqcaKwuWe1q82Y92Cfr7Q5YDh0wMn04389BO5HIuQOYa
         5vloU45IDA7BiULjH5OLmbu2q2XY67XJe1o3JJEaZde4ac/ICc/JCNTbw0zAIz4JrMG0
         oiSJPwm6qaq6XXm0ZIbOAzZdx6qmEO/tVMO5hr16YBq+lRTR+VKW9hGdTDlnkfXZyNVF
         056Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453995; x=1704058795;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9Q+OMVGug+ylz+2uzJShCURagJfqE6miFHjz/+Dgvg=;
        b=ZO24+w082E6XYoNP5sAoAMAFk9UVHq5YamxtKwaVVuwp8iNYkaa1iCzxRR5MiiaG4/
         MqiIWHJDH1zyZaLOzFNW/c/3qv5viaU+p+K4B4H6DN1mGO2jxsz4x9j7CbTtldU0e+Am
         3RI6Axm+aGywnGT+vI8TsvzWRmibW/ktw48fS2PlOy5R2oetvIhRJVsLgJ0Qu73VJf0S
         4eLE5djwhzCvXw1R4AiZhf8+KHxkARj/NLXxfQ8FmeGEYZcH3WKMQ7OwtbptiG9jEn33
         1+X3Y8I87j76pBC6IsfNVYuKXTkOiqp1AiHokdidV6PPwaBFg6GULax9QyulHN8kmKzt
         1IDg==
X-Gm-Message-State: AOJu0YzI9BUykEpUZc0PbJcc1nC6T2A7mvL+zrrd6XKG35mchLM0cV5I
	lN7vF8m7n9FMQqGzRMteMXphyb1lAchQ
X-Google-Smtp-Source: AGHT+IFJfsP5JhgYByhZLf3HirHsXDvYjSFYqzQ3snkAvp0nJS5eXaEyeAz3IXcv8WBPowwQKkdAPg==
X-Received: by 2002:a92:cb09:0:b0:35f:b09b:ccd2 with SMTP id s9-20020a92cb09000000b0035fb09bccd2mr397952ilo.7.1703453995330;
        Sun, 24 Dec 2023 13:39:55 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001ca86a9caccsm6947051pls.228.2023.12.24.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:39:54 -0800 (PST)
Date: Sun, 24 Dec 2023 13:39:53 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
    asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
    cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
    dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 07/10] iommu/sun50i: use page allocation function
 provided by iommu-pages.h
In-Reply-To: <20231130201504.2322355-8-pasha.tatashin@soleen.com>
Message-ID: <2a474224-80fa-3b71-c498-09cf22e5d130@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-8-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/sun50i-iommu.c to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
