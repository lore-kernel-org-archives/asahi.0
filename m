Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58ED1864
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 06:29:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a14so16267467wru.5
        for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 22:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obC1H73kYWHPkG4wu3mJ2CwpJvBxYklv1/XandoYE3Q=;
        b=yMvJsStllE8z4us78HVJmnDckMP3R6ADXanm+EE/rz9qULUXCTIYgClFY8qf9Pq43Q
         EaG6Snfv94RgMM8RAZHaWPLCmGW6zWGA3gITeQJustSQzjOQTdjFb5K1DjuKFkgft03+
         Ph2R/f+5RZ+uqmvspb4l26THljNHmw1rCLLb5P6mHd/V72o1DxD15eTxfzXY9Q26DcPg
         LE6w9JmQjN1LEsmRIGTbkX76jxf80mqxEg6FaPnDqkuYpnxCdltzK7YIptd42qp9SMtB
         /Db4hZumYbvKFPr5zFzWG61zb56jRVNpBzbsd/Bhcv1jwf6QBhDtXEQOq1zlt6dOeolj
         kB5Q==
X-Gm-Message-State: ANoB5plKfEy3uBZs1KbHPqTNDHLm2kjOuXVEzmcOQNrC3SfVZcUifBRy
	bjh5MVuXG5HF3WWghgH6eTrLQLbxI1Y=
X-Google-Smtp-Source: AA0mqf4LAao9G2+P4JK/SmsHLkqRHI9wY8jwy0HEel86sHvhZKGhs2qdDmF8hMRytTW9ucVcou2fMw==
X-Received: by 2002:adf:a4c1:0:b0:236:6f18:37e6 with SMTP id h1-20020adfa4c1000000b002366f1837e6mr6291096wrb.262.1668407373104;
        Sun, 13 Nov 2022 22:29:33 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id j7-20020adfb307000000b0023c8026841csm8656064wrd.23.2022.11.13.22.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 22:29:32 -0800 (PST)
Message-ID: <ad14a460-cee0-a71c-8728-3d0612b08c46@grimberg.me>
Date: Mon, 14 Nov 2022 08:29:31 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 11/13] nvme-pci: move the HMPRE check into
 nvme_setup_host_mem
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221113161138.883195-1-hch@lst.de>
 <20221113161138.883195-12-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221113161138.883195-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Check that a HMB is wanted into the allocation helper instead of the
> caller.  This makes life simpler for an upcoming second caller.

Same here.
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
