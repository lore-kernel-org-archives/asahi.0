Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C917C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 02:56:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id io19so15861960plb.8
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 18:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnSSI7Sa3yUVrWuYkjhNclnSAE5oHS/sxjCr/Bz2Dqw=;
        b=rvqt5uSI3RDfQW6Jv+BB4wJMGzAOd7jkz88/WGKMKZ0IHAR8YunPPTuIkgRZ2/mMGx
         1nUmRRfyfad5b7w1fOwO+ZcaxBp3X0r8hQCsZg7ccXjFQ6GR6I22qaS6GlAlGnb0Dsdw
         wIuf9rAW3ct8jx3BlMQ+KxZWXyW2MJU8Amcjf97RBjWjj7hG8A5yUAqwIMWTs+6zew/U
         NqoGr3ZdIeVSaBHQS1oIpOrMhjIYKmkEDrUpFXhat0a636Vd1jYmjOwnhsrl7/lM+bsr
         R56PSy/twXFCXSSERKEhJdrolysAUzmGA7hQ50BL/+MTPotRUzbaRtJPu/li345iAYF6
         53vg==
X-Gm-Message-State: ACrzQf01lgeZ72fb4hEUvZU2ANRQz3s9LQq6lp6+QLiJLgyCIsTW/BIc
	HslpEEMj5MAVNap3Xsnr7Y4=
X-Google-Smtp-Source: AMsMyM4Kox725PyRwAUjMB11xlnqnVStSsW52yU58jE+Nn8jz2ru/uQCLyCjQEBrBlnRtNrtwu9tow==
X-Received: by 2002:a17:902:ccc2:b0:178:29f9:5c5e with SMTP id z2-20020a170902ccc200b0017829f95c5emr56391951ple.21.1667962560904;
        Tue, 08 Nov 2022 18:56:00 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id i4-20020a63cd04000000b0045751ef6423sm6484001pgg.87.2022.11.08.18.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 18:56:00 -0800 (PST)
Message-ID: <b469706e-19a6-1e34-0f2b-9a84eb473087@grimberg.me>
Date: Wed, 9 Nov 2022 04:55:58 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/12] nvme: move OPAL setup from PCIe to core
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-3-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Nice

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
