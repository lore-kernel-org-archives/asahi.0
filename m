Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9E8F62
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EeniAk5D"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 31F0287952;
	Sun, 29 Oct 2023 16:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592186;
	bh=sKHgki2nziy1toYhIZEG3yUczKCpdrcW8aqvjH1nub0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EeniAk5DSPLbuKAFWiGxUxqc5yfzdv7gWgk8tLNpFfydg43hQ0jN6k6igm62Sr7zp
	 ekOMSLL30UL1wVLAhIE2UTtM5GvV3mciufiNGkhq3Li7iCV2OVYxLzAs3cEsOsD8zg
	 rgmw/4PEta0nb31YnP67NTPfATfS7GikToZlOy0/132sju5cdVOTx22ADZSnPWRwR3
	 bmHaVoIAk6gcoTcMf+yeaAIKFZt6HecjQVVIvjsVsBDOdEBc7KQBCugeVBMW8Gv4nL
	 PjjIoyjax5GGHmAEu1sgLlIGC2ff2D0aTJoPRdL/N/uGoCvQiOjnPagMXhZRz6cqrZ
	 mFJzq2gkwCASQ==
Message-ID: <177e3af7-9ea5-42ca-8712-9c27ed8eeaca@denx.de>
Date: Sun, 29 Oct 2023 15:34:59 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] usb: xhci: Allow context state errors when halting
 an endpoint
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
 <20231029-usb-fixes-1-v2-3-623533f6316e@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-1-v2-3-623533f6316e@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 07:37, Hector Martin wrote:
> There is a race where an endpoint may halt by itself while we are trying
> to halt it, which results in a context state error. See xHCI 4.6.9 which
> mentions this case.
> 
> This also avoids BUGging when we attempt to stop an endpoint which was
> already stopped to begin with, which is probably a bug elsewhere but
> not a good reason to crash.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   drivers/usb/host/xhci-ring.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index d21e76e0bdb6..e02a6e300c4f 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -545,6 +545,7 @@ static void abort_td(struct usb_device *udev, int ep_index)
>   	struct xhci_ctrl *ctrl = xhci_get_ctrl(udev);
>   	struct xhci_ring *ring =  ctrl->devs[udev->slot_id]->eps[ep_index].ring;
>   	union xhci_trb *event;
> +	xhci_comp_code comp;
>   	trb_type type;
>   	u64 addr;
>   	u32 field;
> @@ -573,10 +574,11 @@ static void abort_td(struct usb_device *udev, int ep_index)
>   		printf("abort_td: Expected a TRB_TRANSFER TRB first\n");
>   	}
>   
> +	comp = GET_COMP_CODE(le32_to_cpu(event->event_cmd.status));
>   	BUG_ON(type != TRB_COMPLETION ||
>   		TRB_TO_SLOT_ID(le32_to_cpu(event->event_cmd.flags))
> -		!= udev->slot_id || GET_COMP_CODE(le32_to_cpu(
> -		event->event_cmd.status)) != COMP_SUCCESS);
> +		!= udev->slot_id || (comp != COMP_SUCCESS && comp
> +		!= COMP_CTX_STATE));

Can you please, in the process, reformat this condition so it is more 
readable ?

>   	xhci_acknowledge_event(ctrl);
>   
>   	addr = xhci_trb_virt_to_dma(ring->enq_seg,

Reviewed-by: Marek Vasut <marex@denx.de>
