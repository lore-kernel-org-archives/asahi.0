Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DC10948
	for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TNrmlW8Y"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3600101e819so19175ab.0
        for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 13:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703454029; x=1704058829; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ze3dFp7nuwLIlYyxkNcxvwY2+LEPIxqYIZFYJMGB88=;
        b=TNrmlW8YQ7nsqzKmBKLGNRK6lOGa2iGBXcTohBVJuNRx/faAr9blV+4l0b1nmR5U0z
         XplrORJMIws7zRTa1NeENPRq1i84KGWV32BYnMJZhwqIMavo+omts+UJxzjdXEnq5cM4
         FbOmTjnv8uUGTJVRgTYI6TLlE94UDlOtd2DMdqXo5OYOtK827Waxy9iUpBrALZFgRrC6
         +ajJkUEY3NrFLlx3CbQ5xkUsu2rHPtXTE2MrOFWMlSDJKobPG+193uPjL6CvkgYcAUir
         IYPvSGIcSAeRWWow9zGFqNtmcPk2YbeH8VOHdzLrAQEwxJc0ZI0az//bIdisT2ifuDvq
         GrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703454029; x=1704058829;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ze3dFp7nuwLIlYyxkNcxvwY2+LEPIxqYIZFYJMGB88=;
        b=b0DzCWo/5Qw9BIEPj4qKU78bRcOtRpMuPuI18ErOuxHe+7oALJsc6AgVrw5Dj22s9O
         gifB2nebd2L4IDsay9FCmem60QcPnyI3vHwBr2w7NcokvfW/XXULYZYnadv6z6r3Q0Ip
         Aw0cjEmEtE+9GUQd4rBk2gfxy9pImE377srTBOVOXlfB/I0+ltZMx31aNKfa2+hmbESH
         CkStFG3W5Ot5bHyGV8Q62JktOOpRpyScI7mA6tuL8cLgQutwuuaujVwuMbv//q+rpNq5
         X7zugAZZjUfSSA0oJPq+ZaqrLr6zflfdnJpJJ3/9g+2Td3mModNkWJuBmzh/Neci9gaU
         QieQ==
X-Gm-Message-State: AOJu0YzyiM+CLcRHUcQmVi0B3rTFRXH3SLFmSACC/6wyrDDlYJ2R6vR5
	feaaEP5UWSmagKfs8Fq5Gr3uaWWr/+r6
X-Google-Smtp-Source: AGHT+IGVjH+txTkfFSMsBbhv6Zq0xwdPACuwyfbDHigrPlypESjKlpkGed7PeZwM+hfx5XjzT8YDrA==
X-Received: by 2002:a05:6e02:492:b0:35f:addf:c08e with SMTP id b18-20020a056e02049200b0035faddfc08emr371465ils.19.1703454028683;
        Sun, 24 Dec 2023 13:40:28 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id w22-20020a634756000000b005cd945c0399sm6737737pgk.80.2023.12.24.13.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:40:27 -0800 (PST)
Date: Sun, 24 Dec 2023 13:40:27 -0800 (PST)
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
Subject: Re: [PATCH v2 08/10] iommu/tegra-smmu: use page allocation function
 provided by iommu-pages.h
In-Reply-To: <20231130201504.2322355-9-pasha.tatashin@soleen.com>
Message-ID: <2b7e2912-4be7-4b24-ee56-0378a3ac1d3d@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-9-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/tegra-smmu.c to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
