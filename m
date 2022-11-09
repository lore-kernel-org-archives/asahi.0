Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD44517C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 02:57:12 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id s196so15067631pgs.3
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 18:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=yBqNfXqclnRCD7u2tAODfkmi+Ha/dESs8pfneH0KjIjEUtUqBuCuljhjiVKMFOLITd
         wnlafEgPHoBmvM4yC6AT1GkAtQjdSpnPci1wjxP9GMHB0QZLrdjsaFfzN3pKuGwFIkgR
         D2HysS3wRCaMiJN2KOd5M/fIT4mVYkiywWlr8DN9obXHmAGlnjvD2Il65haG/IIKEa6K
         Bd4owTO65tbDImE+3jLi0tcQYLF6pkvRDkzW/dlw+SyWMjMPEQhF5r0agozoVALGXJo8
         ACtC4qNw8cRncK34G9Y5V7ntbBlDNeDwx24Iw0EEtQAEQtPBJXdzRyTBKTl3vidhnVbS
         bR4A==
X-Gm-Message-State: ACrzQf0sSCW5Pz0HLHtI3+ICraTSEXdVCtfHouaj3Oz+MsDDn64IzRSG
	27W12OlaKY+rMP1O5egnZU4=
X-Google-Smtp-Source: AMsMyM4xtTYhW17B2CKQu4HnS9hmOYEMFWL0YRjJ3wvUH0U1lWuwxpx+hWKzpOZ6qVbzV0E68Iqopg==
X-Received: by 2002:a65:5886:0:b0:439:8dd3:18d4 with SMTP id d6-20020a655886000000b004398dd318d4mr49748860pgu.430.1667962632416;
        Tue, 08 Nov 2022 18:57:12 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id l15-20020a170903244f00b001869d71228bsm7713655pls.170.2022.11.08.18.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 18:57:11 -0800 (PST)
Message-ID: <3855b0ef-f34e-4f9d-254c-7111299bd480@grimberg.me>
Date: Wed, 9 Nov 2022 04:57:10 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 03/12] nvme: simplify transport specific device attribute
 handling
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-4-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
