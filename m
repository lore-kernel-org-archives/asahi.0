Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE99417C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 02:55:49 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z26so15500762pff.1
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 18:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pr8jpi42XLrkYS7gdd3XLY6V5/KTVZL2wfJp7gJJnoo=;
        b=owNH+Vh4ogtSYJHzY6FqgUCSZD8VNjJi+Ftx907UsFye86plj/HYxDp/Ty/VCQkHVi
         fbHDPMTkfKkI6J6N/CQ1ZgE63aZpIb6XHOiAB6tNYgP4ozpiJuqtoVlKT6GByX1rDYX3
         frG5v34/45OeI9MBH7Zu6pjhAe1G2+HQvGTSjSvRwJJXxr+cB9hnyVXaY93hu4pR4yvx
         4X+cpJieT0OfjMVdiPLZZ7vkF2UKmJpqiant+wYBouFNIrO8/m6Ks+vp3VReRZaNkVt+
         5fU77kRotUCFMejOSMQga9ynBHJFxRcCxpsG/qYsAVds/RKQ7H1HB6QlK1fLB157DW5e
         HRNg==
X-Gm-Message-State: ACrzQf3QCrOAl1AFscb7JEn98LBMPk5ADdT423TeHtl+es1YDk4IQn2T
	7cBoVutB7dcCXQd5F1g3V+E=
X-Google-Smtp-Source: AMsMyM6NTXB3au5qSi0Bg4jg71pvryW9B3UAElRci7agl3s/I6jdzrQt6DGwjKOVChyr6f4HStqZ6A==
X-Received: by 2002:a65:6c08:0:b0:448:c216:fe9 with SMTP id y8-20020a656c08000000b00448c2160fe9mr49250562pgu.243.1667962549303;
        Tue, 08 Nov 2022 18:55:49 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id q9-20020a6557c9000000b0046ec7beb53esm6532227pgr.8.2022.11.08.18.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 18:55:48 -0800 (PST)
Message-ID: <6f12b92c-a117-9c27-cd67-8c9fd9571a06@grimberg.me>
Date: Wed, 9 Nov 2022 04:55:47 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 01/12] nvme-pci: don't call nvme_init_ctrl_finish from
 nvme_passthru_end
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-2-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> nvme_passthrough_end can race with a reset, so we should not call
> nvme_init_ctrl_finish from here.  Instead just log that the controller
> capabilities might have changed.

Can you explain here what is the problem caused by calling this from
here?
