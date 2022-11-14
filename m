Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907721864
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 06:25:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y16so16222029wrt.12
        for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 22:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=rFwE5PglXn0zQ0CnT3NGSPJ323DJBt6EhxIYizKVyRgIfPsQET5v/YLJ3F/Tk9uuhT
         mljPjtg/7oCR7xw0ZH1dUm9r7aziAKV7F7694P3qXBTCmoUqE9hqPV2hhV9xmSOnKjet
         T5RQ/tCIZuB60vsNXUP+fSECzxv3Y3VuVMZe6fL/FzOEwYO85B9gdPRzXCjHLjReIudN
         rsacIORv4lxLmOYSQUP8aLOioVfU+3Y7yjWCE0w1UOzZQqGuIrInL9v9o/k4lm2F6BAq
         Smpvr9t53hOBfdyTsqQhKv49JvMOy0bcpcEewBIJGSsd406N87Wzh82+N7TQzuHFx2Y4
         e3xQ==
X-Gm-Message-State: ANoB5pnKCqzxlEqrYeLqiaZlmYheK1/mjqvztvu58CDR6MaL/8OiGBP6
	d4Uc/UAPKMUuK+ME9F8bE1E=
X-Google-Smtp-Source: AA0mqf5jUvs7XHRTnRU6IUIwbNgv3dcPsH39/jeddxmzz9QgNd+Z1vxCQFdz0JDXY91QQO4M+kGU5Q==
X-Received: by 2002:a5d:538e:0:b0:236:71fe:c9c6 with SMTP id d14-20020a5d538e000000b0023671fec9c6mr6154284wrv.501.1668407130853;
        Sun, 13 Nov 2022 22:25:30 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b003cf54b77bfesm18094824wms.28.2022.11.13.22.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 22:25:30 -0800 (PST)
Message-ID: <43868b9f-548d-6d8d-197e-b5c21d7ea856@grimberg.me>
Date: Mon, 14 Nov 2022 08:25:28 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 01/13] nvme: don't call nvme_init_ctrl_finish from
 nvme_passthru_end
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221113161138.883195-1-hch@lst.de>
 <20221113161138.883195-2-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221113161138.883195-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
