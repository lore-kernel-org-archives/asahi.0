Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41710E7
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 06:32:25 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id o4so16173853wrq.6
        for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 22:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=FcXWU3YQ6HPJuB4JI5Bz4qN3H0xqQEtSdEDQyRLEN4fmKS0tiBcBo7gMwgJ0jeS5L3
         3bRW15LY/Y512r67i70Jn7avaMt3auLPGFR9QGb2pYIFEjGQRFsgArdHV8Ch0IVGV/Tt
         +CSCnKdUj1vPM3oRui5ivJQAQAT9yNNPxUC3YI8I7G3m1ObGD+cNnFhFe4w/5arfKaW0
         1em/YPyg29TD9OhhV8xOE090A2y12lteIgXeUfHitJj6CkBBDni1jO+YJen3J9Q0azYS
         mjyLC/JxfqtP8VQpsxRy+hfgooXHIM44fwlPu44Ga1DwQxOJxCObzIuMTM26brYCt2W7
         8YNQ==
X-Gm-Message-State: ANoB5pm1hEperF9edSrKVYjorYwSKOcp7akU05edMoGGNO5drt+SlJRj
	CVDV6VQqWvS7TBr5iAgL/ik=
X-Google-Smtp-Source: AA0mqf7WDKccuVmk/zAud4HA9xAgeKTDvQzWA+Ollpk4we7CvgOfB6NI06ZJGAXrFHTRE5xR7egHyQ==
X-Received: by 2002:a5d:4b4e:0:b0:236:6deb:4498 with SMTP id w14-20020a5d4b4e000000b002366deb4498mr6663711wrs.52.1668407544330;
        Sun, 13 Nov 2022 22:32:24 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b47e8a5d22sm19304583wmq.23.2022.11.13.22.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 22:32:23 -0800 (PST)
Message-ID: <e51a514c-d19e-71c5-cc30-b226f4eb7703@grimberg.me>
Date: Mon, 14 Nov 2022 08:32:22 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 13/13] nvme-pci: don't unbind the driver on reset failure
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221113161138.883195-1-hch@lst.de>
 <20221113161138.883195-14-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221113161138.883195-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
