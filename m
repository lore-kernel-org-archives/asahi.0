Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B5A5D
	for <asahi@lists.linux.dev>; Wed,  4 Jan 2023 12:03:06 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b145so18578422pfb.2
        for <asahi@lists.linux.dev>; Wed, 04 Jan 2023 04:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbKqkFsN4hQeaKGBwT0swWYlTLMQd/HhdjuV7OkFZck=;
        b=mHVGqX8H91pzBJ3DqpDdUa8q5l+Xnziz+IY+I893b//GyPfrcaV4LyEnL5N7W5orqd
         KhjDg2DKRkhNeg7kPMi5/Dhy3WkN7600cWS/0Yu9rxCpyqo6ycTsVO0NN2JpLSH8kMyK
         vXORpTS7mvElXy7DsHenbpJaJVvGFX/hjwlGlF0eg94KlhEZgBDawY7WE2dRw3ar+b2i
         KCiH4TGS/ukHVvhsiEvXeIHB87DmZkltPYIzUeRllH6xEgLaT6NJ0QPl9TZhB2tEE4Ex
         wsFb6n+q+5/6hA8Q+vPZ5CnnwLwj2nu7jw2G2lKejRqy5shn0+KKHYefSNm2sZ/Hxh65
         xfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbKqkFsN4hQeaKGBwT0swWYlTLMQd/HhdjuV7OkFZck=;
        b=4/HmDlcii2nqw4n+BTq8K4dM/g4Q8dc8zpYv5hykiCytOFHIaO6+cdKEsQYEEbYKAS
         hPiWyWOP8HrDgeDX8Gc1mvDEzD4KB8yUurrb/Dg7mC2po6AEjP4Ltc8bRyX2YMu0jBPM
         FImEMZZ4fKJleVxPI/R+tSX9j4JuUL8ZF6KATLhXn+0WqsiTuGaI6/c2JO8YIi3yZD1x
         FSoPSh3k8rC2Wecc/qieC+ev7JuKiO0e1Fb1PEAk5ilv8FrLdFQHsaWd1qIBgRGYc5kS
         Y0wbfFFHCHphFh3H6Xb6xkahEBXO1WlVh5BYfch1G6LBGPSvsEoDjmz4HBqa4zkeF6oA
         l0ZQ==
X-Gm-Message-State: AFqh2kpM19Ck3oBtOvVhhS8dVjPtdemoaWLcy6BSuw1qsGDYJuWP0oJk
	pW+HM8+Y4EVkrbFD0ogA6wM=
X-Google-Smtp-Source: AMrXdXvLlycQwR2yfcSSdIDuT8mAhKbn5aH7b2zhWOcV7RFoNEz+oc6njRkxGsmdCSs+xOoNDXJDDQ==
X-Received: by 2002:a62:e317:0:b0:581:4297:362f with SMTP id g23-20020a62e317000000b005814297362fmr33459797pfh.13.1672833785678;
        Wed, 04 Jan 2023 04:03:05 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id d18-20020aa797b2000000b0058251b6e0e8sm6856527pfq.188.2023.01.04.04.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 04:03:05 -0800 (PST)
Date: Wed, 4 Jan 2023 23:03:00 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: marcan@marcan.st
Cc: asahi@lists.linux.dev, axboe@fb.com, hch@lst.de, kbusch@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 sagi@grimberg.me, sven@svenpeter.dev, ushankar@purestorage.com
Subject: Re: [PATCH] nvme-pci: Add NVME_QUIRK_IDENTIFY_CNS quirk to Apple T2
 controllers
Message-ID: <20230104230300.66b4a581@redecorated-mbp>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
In-Reply-To: <20230104101641.12215-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> This mirrors the quirk added to Apple Silicon controllers in apple.c.
> These controllers do not support the Active NS ID List command and
> behave identically to the SoC version judging by existing user
> reports/syslogs, so will need the same fix. This quirk reverts
> back to NVMe 1.0 behavior and disables the broken commands.
>
> Fixes: 811f4de0344d ("nvme: avoid fallback to sequential scan due to transient issues")
> Signed-off-by: Hector Martin <marcan@marcan.st>

On T2 macbookpro16,1 with 6.2.0-rc3-00010-g69b41ac87e4a I had this in
dmesg:

nvme nvme0: 1/0/0 default/read/poll queues
nvme nvme0: Identify NS List failed (status=0xb)

And in /dev only nvme0 existed (no nvme0n1*).

This patch fixed that and /dev/nvme0n1p* existed.

Tested-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
