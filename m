Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F232A53
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rih5cCYJ"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8DB4387634;
	Sun, 29 Oct 2023 16:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592181;
	bh=fZlnWywCqzBOCjZGY+uLir1/VvcOor3h+lyENa59NT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rih5cCYJYliq1mz4GtjK56DSIctBr87R7cuFzwXSl60e/vbyIGQnH+R7FN32jrS9Q
	 V9dWK1h9ZowQxcnQ2FhhtwXNMGU1JZ4uubzDHF6gelutZo1sbWjs1uG3cd1dnIpYgw
	 kIxWB5Pjkvtte+iDr+5OjBRVl8z8XJQ1CsQ3fcr29FDoY0npdV/xvhvPAL4yL7Skep
	 a30Po3O7Lksd3lgNEHsIasu0xask54oQp0FYjrDugiRsg1DThNVHCLFdrD0LhzQlNJ
	 KciE0ngqKrSYUcSTWqzPDYwswohc6N+oIyqnVq24zgI5jWPJQicl52A+qksOQElbZB
	 VKeVWovmHxcKQ==
Message-ID: <6173c4f2-1d70-43dc-baab-a6db76f04b77@denx.de>
Date: Sun, 29 Oct 2023 13:07:15 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] scsi: Fix a bunch of SCSI definitions.
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
 <20231029-usb-fixes-3-v1-1-0153210a7f55@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-3-v1-1-0153210a7f55@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:23, Hector Martin wrote:
> 0x9e isn't Read Capacity, it's a service action and the read capacity
> command is a subcommand.
> 
> READ16 is not 0x48, it's 0x88. 0x48 is SANITIZE and that sounds like we
> might have been destroying data instead of reading data. No bueno.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   drivers/ata/ahci.c  | 9 ++++++---
>   drivers/scsi/scsi.c | 4 ++--
>   include/scsi.h      | 8 ++++++--
>   3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
> index 2062197afcd3..b252e9e525db 100644
> --- a/drivers/ata/ahci.c
> +++ b/drivers/ata/ahci.c
> @@ -906,15 +906,18 @@ static int ahci_scsi_exec(struct udevice *dev, struct scsi_cmd *pccb)
>   	case SCSI_RD_CAPAC10:
>   		ret = ata_scsiop_read_capacity10(uc_priv, pccb);
>   		break;
> -	case SCSI_RD_CAPAC16:
> -		ret = ata_scsiop_read_capacity16(uc_priv, pccb);
> -		break;
>   	case SCSI_TST_U_RDY:
>   		ret = ata_scsiop_test_unit_ready(uc_priv, pccb);
>   		break;
>   	case SCSI_INQUIRY:
>   		ret = ata_scsiop_inquiry(uc_priv, pccb);
>   		break;
> +	case SCSI_SRV_ACTION_IN:
> +		if ((pccb->cmd[1] & 0x1f) == SCSI_SAI_RD_CAPAC16) {
> +			ret = ata_scsiop_read_capacity16(uc_priv, pccb);
> +			break;
> +		}

Would it make sense to add an else branch here and report unknown 
subcommand there ?

With that:
Reviewed-by: Marek Vasut <marex@denx.de>
