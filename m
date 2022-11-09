Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203F17C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:04:47 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id v28so15479710pfi.12
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=jiiaq2D1NdVJYbrjjIs4cTXQrrKV0q00N07gVt/hwYalVwq+JD9JbjbShiyAXetG8x
         gIuCwySmFOAqWJvC7KsZL0kqxrX6NUId2e4HUn5t3/eTF+UEW5PS3dCNJDeygf2tfg2L
         abmx8+NWRmLYyOMi6Q5dd7Gp1ypSiW/R1JJpeXPBj63LYbChBRcKRGrkoLV1L+EJrW3L
         +mFyM/g0CRyvcLobBe91uW/B6A+AXYA9LsWy7qzmZl7pXRkK6ixLa49+Rvf0q7eDcalL
         KHc+dPa1AzOI/GWI2u2zyGtfaRuAp3OsH1saES5JRAaBysw/bHYT/BXUN+FR1poS5k1c
         3/fQ==
X-Gm-Message-State: ACrzQf0XwzDeI2CzQHZMlJjeboNs6CZhVVPC7mU8wdpxU2ey/S/4Rcp5
	MrHBmH9jsAy+Sg0h222PrX0=
X-Google-Smtp-Source: AMsMyM7/cykDVCGPc9CgHn1eKwI3fCFN+F+jOxzQfj+H42a2odAwFKU8A6E8xkBRjq+wMFB+l8xA3Q==
X-Received: by 2002:a63:4711:0:b0:46f:9f4a:2dd0 with SMTP id u17-20020a634711000000b0046f9f4a2dd0mr45668758pga.78.1667963087488;
        Tue, 08 Nov 2022 19:04:47 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b001865c298588sm7693334plh.258.2022.11.08.19.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:04:47 -0800 (PST)
Message-ID: <5e4f8c8f-0561-8142-5bc7-a47b29e56071@grimberg.me>
Date: Wed, 9 Nov 2022 05:04:45 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 09/12] nvme-pci: call nvme_pci_configure_admin_queue from
 nvme_pci_enable
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-10-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
