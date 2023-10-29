Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD16AA0
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="u5PhNa6f"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BB4618795E;
	Sun, 29 Oct 2023 16:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592184;
	bh=WBg3zzwUVCRNi2vGPSneMzKV+G7YA0lW40MucbTINUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u5PhNa6fI+3I8U9Cdd8cLVTPXVErPYE5fS27qMMwnZvaq7Cl6fEyAxBqG1gi0PBXd
	 8MvuYH7TyFCzSq8pwJpwB6SloAX5COJG/Xb8P1otMsffRGmYSBXK5JYtV30/wSHTSx
	 sTGDdLbKEQCRvS7owC7pIqzrOdIUQT4M9TsN3XJW3iNoxB0oTa88pQq0GA761qZI6z
	 e2g2wBQHAtTLqEDn6ZWCIU2WddXBiOiAsvZ4OuT/uosFfm35EfY5cf6mqfM8wMAXWn
	 ROFUKDjA3emwsvNS1BhEGLgr2OYH1txxxEqxJRcBTLXdLG70X+wrgZ6sfh4uLHAHFi
	 zs2prI3mP4XSQ==
Message-ID: <55e99fe7-2efc-4c95-bd81-a7e840068460@denx.de>
Date: Sun, 29 Oct 2023 13:13:28 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: kbd: Ignore Yubikeys
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
 <20231029-usb-fixes-2-v1-1-9f793aa20fe4@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-2-v1-1-9f793aa20fe4@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:09, Hector Martin wrote:
> We currently only support one USB keyboard device, but some devices
> emulate keyboards for other purposes. Most commonly, people run into
> this with Yubikeys, so let's ignore those.
> 
> Even if we end up supporting multiple keyboards in the future, it's
> safer to ignore known non-keyboard devices.
> 
> This is particularly important to avoid regressing some users, since
> YubiKeys often *don't* work due to other bugs in the USB stack, but will
> start to work once they are fixed.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   common/usb_kbd.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/common/usb_kbd.c b/common/usb_kbd.c
> index 352d86fb2ece..e8c102c567e4 100644
> --- a/common/usb_kbd.c
> +++ b/common/usb_kbd.c
> @@ -120,6 +120,15 @@ struct usb_kbd_pdata {
>   
>   extern int __maybe_unused net_busy_flag;
>   
> +/*
> + * Since we only support one usbkbd device in the iomux,
> + * ignore common keyboard-emulating devices that aren't
> + * real keyboards.
> + */
> +const uint16_t vid_blocklist[] = {
> +	0x1050, /* Yubico */

I wonder if it would be better to have this default, but make the list 
configurable via environment variable too. This way, if users run into 
more weird devices, they could just:

=> setenv vid_blocklist "0x1234,0x5678" ; saveenv ; usb reset
